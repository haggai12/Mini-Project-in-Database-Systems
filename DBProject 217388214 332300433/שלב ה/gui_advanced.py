import customtkinter as ctk
from tkinter import ttk, messagebox

class AdvancedFrame(ctk.CTkFrame):
    def __init__(self, master, db):
        super().__init__(master, corner_radius=10)
        self.db = db

        # Title
        self.label = ctk.CTkLabel(self, text="Advanced Queries & Procedures", font=ctk.CTkFont(size=24, weight="bold"))
        self.label.pack(pady=10)

        # --- Procedures Section (Stage 4) ---
        self.proc_frame = ctk.CTkFrame(self)
        self.proc_frame.pack(fill="x", padx=20, pady=10)
        
        ctk.CTkLabel(self.proc_frame, text="Procedures (Stage 4)", font=ctk.CTkFont(size=18, weight="bold")).pack(pady=5)

        # Procedure 1
        self.btn_proc1 = ctk.CTkButton(self.proc_frame, text="1. Auto-Assign Urgent Missions (Severity 4+)", command=self.run_proc1)
        self.btn_proc1.pack(pady=5)

        # Procedure 2
        self.proc2_inner = ctk.CTkFrame(self.proc_frame, fg_color="transparent")
        self.proc2_inner.pack(pady=5)
        ctk.CTkLabel(self.proc2_inner, text="Cutoff Date:").pack(side="left", padx=5)
        self.entry_date = ctk.CTkEntry(self.proc2_inner, width=100)
        self.entry_date.insert(0, "2024-01-01")
        self.entry_date.pack(side="left", padx=5)
        self.btn_proc2 = ctk.CTkButton(self.proc2_inner, text="2. Flag Old Drones for Maintenance", command=self.run_proc2)
        self.btn_proc2.pack(side="left", padx=5)

        # --- Queries Section (Stage 2) ---
        self.query_frame = ctk.CTkFrame(self)
        self.query_frame.pack(fill="both", expand=True, padx=20, pady=10)

        ctk.CTkLabel(self.query_frame, text="Complex Queries (Stage 2)", font=ctk.CTkFont(size=18, weight="bold")).pack(pady=5)

        self.btn_frame = ctk.CTkFrame(self.query_frame, fg_color="transparent")
        self.btn_frame.pack(pady=5)

        self.btn_q5 = ctk.CTkButton(self.btn_frame, text="Run Query 5: Expiring Certifications", command=self.run_query5)
        self.btn_q5.pack(side="left", padx=10)

        self.btn_q8 = ctk.CTkButton(self.btn_frame, text="Run Query 8: Flight Alerts by Hour", command=self.run_query8)
        self.btn_q8.pack(side="left", padx=10)

        # Table for query results
        self.tree = ttk.Treeview(self.query_frame, show="headings", height=8)
        self.tree.pack(fill="both", expand=True, pady=10, padx=10)

    def run_proc1(self):
        query = "CALL auto_assign_urgent_missions(4);"
        success, err = self.db.execute_query(query)
        if success:
            messagebox.showinfo("Success", "Procedure 'auto_assign_urgent_missions' completed successfully.\nCheck your missions and drones table for updates.")
        else:
            messagebox.showerror("Error", f"Procedure failed:\n{err}")

    def run_proc2(self):
        cutoff = self.entry_date.get()
        if not cutoff:
            messagebox.showwarning("Input Error", "Please enter a cutoff date.")
            return
        query = f"CALL flag_drones_for_maintenance('{cutoff}');"
        success, err = self.db.execute_query(query)
        if success:
            messagebox.showinfo("Success", f"Procedure completed successfully.\nDrones purchased before {cutoff} have been flagged for maintenance.")
        else:
            messagebox.showerror("Error", f"Procedure failed:\n{err}")

    def display_results(self, columns, records):
        """Helper function to display dynamic columns in the Treeview"""
        # Clear existing
        self.tree.delete(*self.tree.get_children())
        self.tree["columns"] = columns
        
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=150)
            
        for r in records:
            self.tree.insert("", "end", values=r)

    def run_query5(self):
        query = '''
            select o.first_name, o.last_name, STRING_AGG(dm.model_name, ', ') as expiring_models
            from operator_certifications oc
            JOIN drone_models dm ON oc.model_id = dm.model_id
            JOIN operators o ON oc.operator_id = o.operator_id
            WHERE oc.license_expiration_date BETWEEN current_date and current_date + interval '60 days'
            group by oc.operator_id, o.first_name, o.last_name;
        '''
        records = self.db.fetch_all(query)
        self.display_results(("First Name", "Last Name", "Expiring Models"), records)

    def run_query8(self):
        query = '''
            select
                    EXTRACT (HOUR from fa.alert_timestamp) as hour,
                    count(*) as number_of_alerts,
                    round(AVG(fa.severity_level),3) as average_severity_level
            from flight_alerts fa
            group by EXTRACT (HOUR from fa.alert_timestamp)
            order by number_of_alerts desc;
        '''
        records = self.db.fetch_all(query)
        self.display_results(("Hour of Day", "Total Alerts", "Average Severity"), records)
