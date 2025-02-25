from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello, World!"}

@app.get("/health", status_code=200) 
def health_check():
    return {"status": "health"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=3000)
