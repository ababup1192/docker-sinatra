# FROM ruby:2.3.1
FROM inzinger/alpine-ruby:2.3

RUN gem install bundler
RUN gem install foreman

COPY . /app
WORKDIR /app
EXPOSE 4567
RUN bundler
CMD ["foreman",  "start",  "-d",  "/app",  "-f",  "/app/Procfile",  "-p",  "4567"]
