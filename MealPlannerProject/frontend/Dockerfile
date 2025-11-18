FROM python:3.10-slim

WORKDIR /api

COPY ./ /api

RUN pip install --no-cache-dir --upgrade -r /api/requirements.txt

CMD ["streamlit", "run", "streamlit_app.py", "--server.port=8501", "--server.enableCORS=true"]