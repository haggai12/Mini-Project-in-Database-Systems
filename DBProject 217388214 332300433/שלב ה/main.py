# pyrefly: ignore [missing-import]
import customtkinter as ctk

# Import the database manager and frames
from database import Database
from gui_drones import DronesFrame
from gui_missions import MissionsFrame

# Set the appearance mode and color theme
ctk.set_appearance_mode("System")  # Modes: "System" (standard), "Dark", "Light"
ctk.set_default_color_theme("blue")  # Themes: "blue" (standard), "green", "dark-blue"

class App(ctk.CTk):
    def __init__(self):
        super().__init__()

        # --- Window Configuration ---
        self.title("Drone Control System - Database GUI")
        self.geometry("900x600")
        
        # Initialize Database connection
        self.db = Database()

        # --- Layout Configuration ---
        # 1 row, 2 columns (Sidebar on the left, Main content on the right)
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)

        # --- Sidebar (Navigation) ---
        self.sidebar_frame = ctk.CTkFrame(self, width=200, corner_radius=0)
        self.sidebar_frame.grid(row=0, column=0, sticky="nsew")
        self.sidebar_frame.grid_rowconfigure(5, weight=1) # Push bottom elements down

        self.logo_label = ctk.CTkLabel(self.sidebar_frame, text="SkyNet System", font=ctk.CTkFont(size=20, weight="bold"))
        self.logo_label.grid(row=0, column=0, padx=20, pady=(20, 10))

        self.btn_dashboard = ctk.CTkButton(self.sidebar_frame, text="Dashboard", command=self.show_dashboard)
        self.btn_dashboard.grid(row=1, column=0, padx=20, pady=10)

        self.btn_drones = ctk.CTkButton(self.sidebar_frame, text="Manage Drones", command=self.show_drones)
        self.btn_drones.grid(row=2, column=0, padx=20, pady=10)

        self.btn_missions = ctk.CTkButton(self.sidebar_frame, text="Manage Missions", command=self.show_missions)
        self.btn_missions.grid(row=3, column=0, padx=20, pady=10)

        self.btn_advanced = ctk.CTkButton(self.sidebar_frame, text="Advanced Actions", command=self.show_advanced)
        self.btn_advanced.grid(row=4, column=0, padx=20, pady=10)

        # --- Main Content Frame ---
        self.main_frame = ctk.CTkFrame(self, corner_radius=10)
        self.main_frame.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        # Start by showing the dashboard
        self.show_dashboard()

    def clear_main_frame(self):
        """Removes all widgets from the main frame before loading a new screen"""
        for widget in self.main_frame.winfo_children():
            widget.destroy()

    def show_dashboard(self):
        self.clear_main_frame()
        label = ctk.CTkLabel(self.main_frame, text="Welcome to SkyNet System Dashboard", font=ctk.CTkFont(size=24, weight="bold"))
        label.pack(pady=50)
        
        desc = ctk.CTkLabel(self.main_frame, text="Select an option from the sidebar to begin.\n\nNote: Make sure your PostgreSQL server is running\nand credentials in database.py are correct.", font=ctk.CTkFont(size=14))
        desc.pack(pady=10)

    def show_drones(self):
        self.clear_main_frame()
        self.drones_view = DronesFrame(self.main_frame, self.db)
        self.drones_view.pack(fill="both", expand=True)

    def show_missions(self):
        self.clear_main_frame()
        self.missions_view = MissionsFrame(self.main_frame, self.db)
        self.missions_view.pack(fill="both", expand=True)

    def show_advanced(self):
        self.clear_main_frame()
        label = ctk.CTkLabel(self.main_frame, text="Advanced Queries & Procedures", font=ctk.CTkFont(size=24, weight="bold"))
        label.pack(pady=20)
        # Will be implemented in the next chunk...

if __name__ == "__main__":
    app = App()
    app.mainloop()
