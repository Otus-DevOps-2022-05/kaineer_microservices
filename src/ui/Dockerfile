# ui/Dockerfile

FROM ruby:2.2

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
    build-essential=11.7 && \
  rm -rf /var/lib/apt/*

ENV APP_HOME /app

# [Добавляем ключ -p на случай, если путь будет /app/ui, например]
RUN mkdir -p $APP_HOME/view
WORKDIR $APP_HOME

COPY Gemfile* *.rb *.ru $APP_HOME/
COPY views/* $APP_HOME/views/
RUN bundle

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
