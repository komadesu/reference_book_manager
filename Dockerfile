# heroku デプロイ用の Dockerfile

FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs yarn

WORKDIR /app
COPY ./src/Gemfile /app/
COPY ./src/Gemfile.lock /app/
RUN bundle install

COPY ./src /app

