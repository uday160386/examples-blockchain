FROM python:3.12.2-alpine
WORKDIR /experience-blockchain
ENV FLASK_ENV=development
ENV FLASK_APP="/blockchain/app/__init__.py"
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
