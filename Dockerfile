FROM python:3.7-alpine

WORKDIR /app
ENV FLASK_APP main.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_RUN_PORT 3000
EXPOSE 3000
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["flask", "run", "-h", "0.0.0.0", "-p", "3000"]