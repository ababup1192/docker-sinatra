FROM ruby:2.3.1
# FROM inzinger/alpine-ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev \
      postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 postgresql-server-dev-9.4
RUN gem install bundler foreman

COPY . /app
WORKDIR /app
RUN bundle install

EXPOSE 4567
CMD ["foreman", "start", "-d", "/app", "-f", "/app/Procfile", "-p", "4567"]
