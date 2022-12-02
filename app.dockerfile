FROM python:3.8-alpine

WORKDIR /app

COPY . .

ENV FLASK_APP=app.py
ENV FLASK_DEBUG=true
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=3000
ENV PYTHONPATH=.
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


RUN python3 -m venv $VIRTUAL_ENV \
    && chmod +x $VIRTUAL_ENV/bin/activate \
    && . $VIRTUAL_ENV/bin/activate \
    && pip install -r requirements.txt

EXPOSE 3000

CMD ["flask", "run"]
