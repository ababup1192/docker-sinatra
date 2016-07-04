FROM ruby:2.3.1

RUN gem install bundler
RUN gem install foreman

COPY . /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY config.ru /app/config.ru
COPY Procfile /app/Procfile
EXPOSE 4567
RUN bundler
CMD ["foreman",  "start",  "-d",  "/app",  "-f",  "/app/Procfile",  "-p",  "4567"]
