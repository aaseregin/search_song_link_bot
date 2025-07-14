FROM python:3.11.10-slim-bookworm

WORKDIR /opt/tg-odesli-bot

# Копируем только файлы зависимостей для кэширования слоёв
COPY poetry.lock pyproject.toml ./
RUN pip install poetry && poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi --no-root

# Копируем только код бота
COPY tg_odesli_bot ./tg_odesli_bot

CMD ["python", "-m", "tg_odesli_bot.bot"]
