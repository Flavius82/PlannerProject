FROM python:3.13

WORKDIR /api

COPY ./ /api

RUN pip install --no-cache-dir --upgrade -r /api/requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]