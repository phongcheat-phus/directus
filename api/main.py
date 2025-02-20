from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

@app.get("/health", status_code=200) 
def health_check():
    return {"status": "health"}
