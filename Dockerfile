FROM python:3.9

COPY . /apps

WORKDIR /apps

RUN pip3 install -r requirements.txt

CMD python3 manage.py migrate && \
    gunicorn -b 0.0.0.0:80 \
            --preload \
            --workers 4 \
            --log-level DEBUG \
            backend.wsgi:application