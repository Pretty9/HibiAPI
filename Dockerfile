FROM python:bullseye

EXPOSE 8080

ENV PORT=8080 \
    PROCS=1 \
    GENERAL_SERVER_HOST=0.0.0.0

COPY . /hibi

WORKDIR /hibi

RUN touch .env && \
    pip install . && \
    pip install "aioredis<2.0.0"

CMD python -m hibiapi \
    --port $PORT --workers $PROCS