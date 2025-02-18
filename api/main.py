from fastapi import FastAPI
import psycopg2
import os

app = FastAPI()

# ดึงค่าตัวแปรจาก .env
DB_HOST = os.getenv("DB_HOST", "database")
DB_USER = os.getenv("DB_USER", "OSdH5f")
DB_PASSWORD = os.getenv("DB_PASSWORD", "bq0@HX^Tpq")
DB_DATABASE = os.getenv("DB_DATABASE", "db_directus")

@app.get("/")
def hello():
    return {"message": "Hello, World!"}

@app.get("/db")
def test_db_connection():
    try:
        conn = psycopg2.connect(
            dbname=DB_DATABASE,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            expose=5432
        )
        return {"message": "Connected to PostgreSQL!"}
    except Exception as e:
        return {"error": str(e)}