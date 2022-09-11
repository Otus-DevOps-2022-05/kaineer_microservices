# post-py/Dockerfile

FROM python:3.6.0-alpine

# Looks like it will be everywhere
RUN apk add --no-cache build-base=0.4-r1 && \
  rm -rf /var/cache/apk/*

RUN pip install --no-cache --no-cache-dir pip==21.3.1

WORKDIR /app

# [replaced with next line] ADD . /app
COPY VERSION helpers.py post_app.py requirements.txt /app/

RUN pip install --no-cache-dir -r /app/requirements.txt

ENV POST_DATABASE_HOST post_db
ENV POST_DATABASE posts

CMD [ "python3", "post_app.py" ]
