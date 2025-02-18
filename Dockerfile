# ใช้ Base Image เป็น Python
FROM python:3.10

# กำหนด Working Directory ใน Container
WORKDIR /app

# คัดลอกไฟล์ requirements.txt ไปใน Container
COPY api/requirements.txt .

# ติดตั้ง Dependencies
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอกโค้ดทั้งหมดจากโฟลเดอร์ api/ ไปยัง /app
COPY api/ /app/

# เปิดพอร์ต 8000
EXPOSE 8000

# รัน API Server
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]