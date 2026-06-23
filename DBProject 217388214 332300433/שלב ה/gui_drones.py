import customtkinter as ctk
from tkinter import ttk, messagebox

class DronesFrame(ctk.CTkFrame):
    def __init__(self, master, db):
        super().__init__(master, corner_radius=10)
        self.db = db

        # Title
        self.label = ctk.CTkLabel(self, text="Drones Management (CRUD)", font=ctk.CTkFont(size=24, weight="bold"))
        self.label.pack(pady=10)

        # --- Table (Treeview) ---
        # We use standard ttk.Treeview as customtkinter doesn't have a built-in table yet
        self.tree_frame = ctk.CTkFrame(self)
        self.tree_frame.pack(fill="both", expand=True, padx=20, pady=10)

        columns = ("ID", "Model Name", "Purchase Date", "Status")
        self.tree = ttk.Treeview(self.tree_frame, columns=columns, show="headings", height=8)
        
        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=150)
            
        self.tree.pack(fill="both", expand=True)

        # --- Input Form ---
        self.form_frame = ctk.CTkFrame(self)
        self.form_frame.pack(fill="x", padx=20, pady=10)

        # Row 1: ID and Fetch button (For Update Requirement)
        ctk.CTkLabel(self.form_frame, text="Drone ID:").grid(row=0, column=0, padx=10, pady=5)
        self.entry_id = ctk.CTkEntry(self.form_frame, width=100)
        self.entry_id.grid(row=0, column=1, padx=10, pady=5)
        
        self.btn_fetch = ctk.CTkButton(self.form_frame, text="Fetch Data (For Update)", command=self.fetch_for_update)
        self.btn_fetch.grid(row=0, column=2, padx=10, pady=5)

        # Row 2: Other fields
        ctk.CTkLabel(self.form_frame, text="Model ID (for Insert):").grid(row=1, column=0, padx=10, pady=5)
        self.entry_model_id = ctk.CTkEntry(self.form_frame, width=100)
        self.entry_model_id.grid(row=1, column=1, padx=10, pady=5)

        ctk.CTkLabel(self.form_frame, text="Purchase Date (YYYY-MM-DD):").grid(row=1, column=2, padx=10, pady=5)
        self.entry_date = ctk.CTkEntry(self.form_frame, width=150)
        self.entry_date.grid(row=1, column=3, padx=10, pady=5)

        ctk.CTkLabel(self.form_frame, text="Status:").grid(row=1, column=4, padx=10, pady=5)
        self.entry_status = ctk.CTkEntry(self.form_frame, width=100)
        self.entry_status.grid(row=1, column=5, padx=10, pady=5)

        # --- Action Buttons ---
        self.actions_frame = ctk.CTkFrame(self)
        self.actions_frame.pack(fill="x", padx=20, pady=10)

        self.btn_add = ctk.CTkButton(self.actions_frame, text="Add New Drone", fg_color="green", command=self.add_drone)
        self.btn_add.pack(side="left", padx=10)

        self.btn_update = ctk.CTkButton(self.actions_frame, text="Update Drone", fg_color="blue", command=self.update_drone)
        self.btn_update.pack(side="left", padx=10)

        self.btn_delete = ctk.CTkButton(self.actions_frame, text="Delete Drone", fg_color="red", command=self.delete_drone)
        self.btn_delete.pack(side="left", padx=10)

        # Load data initially
        self.load_data()

    def load_data(self):
        """Fetches drones from DB and joins with drone_models to hide Model_ID"""
        for row in self.tree.get_children():
            self.tree.delete(row)
            
        query = '''
            SELECT d.drone_id, dm.model_name, d.purchase_date, d.drone_status
            FROM drones d
            JOIN drone_models dm ON d.model_id = dm.model_id
            ORDER BY d.drone_id ASC
        '''
        records = self.db.fetch_all(query)
        for r in records:
            self.tree.insert("", "end", values=(r[0], r[1], r[2], r[3]))

    def fetch_for_update(self):
        """Requirement: User types ID, system brings the rest of the fields"""
        d_id = self.entry_id.get()
        if not d_id:
            messagebox.showwarning("Input Error", "Please enter a Drone ID to fetch.")
            return

        query = "SELECT model_id, purchase_date, drone_status FROM drones WHERE drone_id = %s"
        records = self.db.fetch_all(query, (d_id,))
        if records:
            rec = records[0]
            self.entry_model_id.delete(0, 'end')
            self.entry_model_id.insert(0, rec[0])
            
            self.entry_date.delete(0, 'end')
            self.entry_date.insert(0, rec[1])
            
            self.entry_status.delete(0, 'end')
            self.entry_status.insert(0, rec[2])
            messagebox.showinfo("Success", "Data fetched! You can now edit the fields and click Update.")
        else:
            messagebox.showerror("Not Found", f"Drone ID {d_id} not found.")

    def add_drone(self):
        d_id = self.entry_id.get()
        m_id = self.entry_model_id.get()
        date = self.entry_date.get()
        status = self.entry_status.get() or 'Available'

        if not (d_id and m_id and date):
            messagebox.showwarning("Input Error", "ID, Model ID, and Date are required.")
            return

        query = "INSERT INTO drones (drone_id, model_id, purchase_date, drone_status) VALUES (%s, %s, %s, %s)"
        if self.db.execute_query(query, (d_id, m_id, date, status)):
            messagebox.showinfo("Success", "Drone added successfully.")
            self.load_data()
            self.clear_entries()

    def update_drone(self):
        d_id = self.entry_id.get()
        m_id = self.entry_model_id.get()
        date = self.entry_date.get()
        status = self.entry_status.get()

        if not d_id:
            messagebox.showwarning("Input Error", "Drone ID is required to update.")
            return

        query = "UPDATE drones SET model_id=%s, purchase_date=%s, drone_status=%s WHERE drone_id=%s"
        if self.db.execute_query(query, (m_id, date, status, d_id)):
            messagebox.showinfo("Success", "Drone updated successfully.")
            self.load_data()
            self.clear_entries()

    def delete_drone(self):
        d_id = self.entry_id.get()
        if not d_id:
            messagebox.showwarning("Input Error", "Drone ID is required to delete.")
            return

        query = "DELETE FROM drones WHERE drone_id = %s"
        if self.db.execute_query(query, (d_id,)):
            messagebox.showinfo("Success", "Drone deleted successfully.")
            self.load_data()
            self.clear_entries()

    def clear_entries(self):
        self.entry_id.delete(0, 'end')
        self.entry_model_id.delete(0, 'end')
        self.entry_date.delete(0, 'end')
        self.entry_status.delete(0, 'end')
