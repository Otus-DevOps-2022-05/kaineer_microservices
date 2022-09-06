# comment/Dockerfile

FROM ruby:2.2

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
    build-essential=11.7 && \
  rm -rf /var/lib/apt/*

ENV APP_HOME /app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY VERSION *.rb config.ru Gemfile* $APP_HOME/
RUN bundle

ENV COMMENT_DATABASE_HOST post_db
ENV COMMENT_DATABASE comments

CMD ["puma"]
