FROM python:3.4

RUN mkdir -p /app /var/www

WORKDIR /var/www

RUN pip install --no-cache-dir  Django==1.11 psycopg2

WORKDIR /var/www

EXPOSE 80

CMD [ "python", "manage.py", "runserver", "0.0.0.0:80" ]
