import customtkinter as ctk
from tkinter import ttk, messagebox

class MissionsFrame(ctk.CTkFrame):
    def __init__(self, master, db):
        super().__init__(master, corner_radius=10)
        self.db = db

        # Title
        self.label = ctk.CTkLabel(self, text="Missions Management (CRUD)", font=ctk.CTkFont(size=24, weight="bold"))
        self.label.pack(pady=10)

        # --- Table (Treeview) ---
        self.tree_frame = ctk.CTkFrame(self)
        self.tree_frame.pack(fill="both", expand=True, padx=20, pady=10)

        columns = ("ID", "Title", "Date", "Status", "Client Name", "Field ID")
        self.tree = ttk.Treeview(self.tree_frame, columns=columns, show="headings", height=8)
        
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=120)
            
        self.tree.pack(fill="both", expand=True)

        # --- Input Form ---
        self.form_frame = ctk.CTkFrame(self)
        self.form_frame.pack(fill="x", padx=20, pady=10)

        # Row 1: ID and Fetch button
        ctk.CTkLabel(self.form_frame, text="Mission ID:").grid(row=0, column=0, padx=5, pady=5)
        self.entry_id = ctk.CTkEntry(self.form_frame, width=70)
        self.entry_id.grid(row=0, column=1, padx=5, pady=5)
        
        self.btn_fetch = ctk.CTkButton(self.form_frame, text="Fetch Data (For Update)", command=self.fetch_for_update)
        self.btn_fetch.grid(row=0, column=2, padx=5, pady=5)

        # Row 2: Other fields
        ctk.CTkLabel(self.form_frame, text="Title:").grid(row=1, column=0, padx=5, pady=5)
        self.entry_title = ctk.CTkEntry(self.form_frame, width=120)
        self.entry_title.grid(row=1, column=1, padx=5, pady=5)

        ctk.CTkLabel(self.form_frame, text="Date:").grid(row=1, column=2, padx=5, pady=5)
        self.entry_date = ctk.CTkEntry(self.form_frame, width=100)
        self.entry_date.grid(row=1, column=3, padx=5, pady=5)

        ctk.CTkLabel(self.form_frame, text="Status:").grid(row=1, column=4, padx=5, pady=5)
        self.entry_status = ctk.CTkEntry(self.form_frame, width=100)
        self.entry_status.grid(row=1, column=5, padx=5, pady=5)
        
        # Row 3: More fields
        ctk.CTkLabel(self.form_frame, text="Client ID:").grid(row=2, column=0, padx=5, pady=5)
        self.entry_client = ctk.CTkEntry(self.form_frame, width=120)
        self.entry_client.grid(row=2, column=1, padx=5, pady=5)

        ctk.CTkLabel(self.form_frame, text="Field ID:").grid(row=2, column=2, padx=5, pady=5)
        self.entry_field = ctk.CTkEntry(self.form_frame, width=100)
        self.entry_field.grid(row=2, column=3, padx=5, pady=5)

        # --- Action Buttons ---
        self.actions_frame = ctk.CTkFrame(self)
        self.actions_frame.pack(fill="x", padx=20, pady=10)

        self.btn_add = ctk.CTkButton(self.actions_frame, text="Add Mission", fg_color="green", command=self.add_mission)
        self.btn_add.pack(side="left", padx=10)

        self.btn_update = ctk.CTkButton(self.actions_frame, text="Update Mission", fg_color="blue", command=self.update_mission)
        self.btn_update.pack(side="left", padx=10)

        self.btn_delete = ctk.CTkButton(self.actions_frame, text="Delete Mission", fg_color="red", command=self.delete_mission)
        self.btn_delete.pack(side="left", padx=10)

        # Load data initially
        self.load_data()

    def load_data(self):
        for row in self.tree.get_children():
            self.tree.delete(row)
            
        # JOIN with clients to show Client_Name instead of Client_ID
        query = '''
            SELECT m.mission_id, m.mission_title, m.mission_date, m.mission_status, c.client_name, m.field_id
            FROM missions m
            JOIN clients c ON m.client_id = c.client_id
            ORDER BY m.mission_id ASC
        '''
        records = self.db.fetch_all(query)
        for r in records:
            self.tree.insert("", "end", values=(r[0], r[1], r[2], r[3], r[4], r[5]))

    def fetch_for_update(self):
        m_id = self.entry_id.get()
        if not m_id:
            messagebox.showwarning("Input Error", "Please enter a Mission ID to fetch.")
            return

        query = "SELECT mission_title, mission_date, mission_status, client_id, field_id FROM missions WHERE mission_id = %s"
        records = self.db.fetch_all(query, (m_id,))
        if records:
            rec = records[0]
            self.entry_title.delete(0, 'end')
            self.entry_title.insert(0, rec[0])
            
            self.entry_date.delete(0, 'end')
            self.entry_date.insert(0, rec[1])
            
            self.entry_status.delete(0, 'end')
            self.entry_status.insert(0, rec[2])

            self.entry_client.delete(0, 'end')
            self.entry_client.insert(0, rec[3])
            
            self.entry_field.delete(0, 'end')
            self.entry_field.insert(0, rec[4] if rec[4] is not None else "")
            
            messagebox.showinfo("Success", "Data fetched! Edit the fields and click Update.")
        else:
            messagebox.showerror("Not Found", f"Mission ID {m_id} not found.")

    def add_mission(self):
        m_id = self.entry_id.get()
        title = self.entry_title.get()
        date = self.entry_date.get()
        status = self.entry_status.get() or 'Pending'
        client = self.entry_client.get()
        field = self.entry_field.get() or None

        if not (m_id and title and date and client):
            messagebox.showwarning("Input Error", "ID, Title, Date, and Client ID are required.")
            return

        query = "INSERT INTO missions (mission_id, mission_title, mission_date, mission_status, client_id, field_id, mission_type) VALUES (%s, %s, %s, %s, %s, %s, 'General')"
        if self.db.execute_query(query, (m_id, title, date, status, client, field)):
            messagebox.showinfo("Success", "Mission added successfully.")
            self.load_data()
            self.clear_entries()

    def update_mission(self):
        m_id = self.entry_id.get()
        title = self.entry_title.get()
        date = self.entry_date.get()
        status = self.entry_status.get()
        client = self.entry_client.get()
        field = self.entry_field.get() or None

        if not m_id:
            messagebox.showwarning("Input Error", "Mission ID is required to update.")
            return

        query = "UPDATE missions SET mission_title=%s, mission_date=%s, mission_status=%s, client_id=%s, field_id=%s WHERE mission_id=%s"
        if self.db.execute_query(query, (title, date, status, client, field, m_id)):
            messagebox.showinfo("Success", "Mission updated successfully.")
            self.load_data()
            self.clear_entries()

    def delete_mission(self):
        m_id = self.entry_id.get()
        if not m_id:
            messagebox.showwarning("Input Error", "Mission ID is required to delete.")
            return

        query = "DELETE FROM missions WHERE mission_id = %s"
        if self.db.execute_query(query, (m_id,)):
            messagebox.showinfo("Success", "Mission deleted successfully.")
            self.load_data()
            self.clear_entries()

    def clear_entries(self):
        self.entry_id.delete(0, 'end')
        self.entry_title.delete(0, 'end')
        self.entry_date.delete(0, 'end')
        self.entry_status.delete(0, 'end')
        self.entry_client.delete(0, 'end')
        self.entry_field.delete(0, 'end')
