FROM python:3.12-slim

ENV POETRY_VIRTUALENVS_CREATE=false

WORKDIR app/

COPY . .

RUN pip install poetry

RUN poetry config installer.max-workers 10
RUN poetry install --no-interaction --no-ansi

RUN poetry run task test

EXPOSE 8001

CMD poetry run uvicorn --host 0.0.0.0 social.app:app