#image python 3.10
FROM python:3.10

#working directory container 
WORKDIR /app

#copy file requirements.txt to container 
COPY api/requirements.txt .

#depends running 
RUN pip install --no-cache-dir -r requirements.txt
RUN pnpm install directus-extension-package-name

#copy all file in api folder to app folder container 
COPY api/ /app/

#open internal port 80000
EXPOSE 8000

# running api server 
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]