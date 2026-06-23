import psycopg2
from psycopg2 import Error

class Database:
    def __init__(self):
        # NOTE: You might need to change the dbname, user, password to match your local PostgreSQL configuration
        self.dbname = "postgres"
        self.user = "postgres.futcvfuapfpibtyxnpvm"
        self.password = "haggaiaaronslater" # Placeholder, user needs to update
        self.host = "aws-1-ap-south-1.pooler.supabase.com"
        self.port = "6543"
        self.connection = None

    def connect(self):
        """Connects to the database and returns the connection object"""
        if self.connection is None or self.connection.closed:
            try:
                self.connection = psycopg2.connect(
                    dbname=self.dbname,
                    user=self.user,
                    password=self.password,
                    host=self.host,
                    port=self.port
                )
            except Error as e:
                print(f"Error connecting to PostgreSQL: {e}")
                return None
        return self.connection

    def close(self):
        """Closes the database connection"""
        if self.connection and not self.connection.closed:
            self.connection.close()

    def fetch_all(self, query, params=None):
        """Executes a SELECT query and returns all results"""
        conn = self.connect()
        if not conn:
            return []
        try:
            with conn.cursor() as cursor:
                cursor.execute(query, params)
                return cursor.fetchall()
        except Error as e:
            print(f"Error fetching data: {e}")
            return []

    def execute_query(self, query, params=None):
        """Executes INSERT, UPDATE, DELETE queries"""
        conn = self.connect()
        if not conn:
            return False
        try:
            with conn.cursor() as cursor:
                cursor.execute(query, params)
                conn.commit()
                return True
        except Error as e:
            print(f"Error executing query: {e}")
            conn.rollback()
            return False
