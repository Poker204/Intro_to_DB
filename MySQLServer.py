import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Step 1: Connect to MySQL server (no specific database yet)
        connection = mysql.connector.connect(
            host='localhost',  # Change to your host if needed
            user='root',       # Replace with your MySQL username
            password='password'  # Replace with your MySQL password
        )

        if connection.is_connected():
            print("Connected to MySQL server")
            
            # Step 2: Create a cursor object to execute SQL commands
            cursor = connection.cursor()
            
            # Step 3: Check if the 'alx_book_store' database already exists
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            
            # Step 4: Commit the transaction
            connection.commit()

            print("Database 'alx_book_store' created successfully!")
    
    except mysql.connector.Error as e:
        # Handle MySQL-specific errors
        print(f"MySQL Error: {e}")
    
    except Exception as e:
        # Handle general exceptions
        print(f"Error: {e}")
    
    finally:
        # Step 5: Close the database connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

# Call the function to create the database
create_database()
