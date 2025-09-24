import subprocess

print("Starting cleaning process...")
subprocess.run(["python", "fetch_new_data.py"])

print("Cleaning complete. Uploading to PostgreSQL...")
subprocess.run(["python", "upload_to_postgres.py"])

print("Pipeline completed.")
