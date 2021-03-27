# heroku デプロイ用の Dockerfile
FROM ruby:2.7

ENV RAILS_ENV=production

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn
WORKDIR /app
COPY ./src /app
RUN bundle config --local set path 'vendor/bundle' \
  && bundle config --local set without 'development test' \
  && bundle install \
  && bundle exec rails assets:precompile
COPY ./src /app

COPY start.sh /start.sh
RUN chmod 744 /start.sh

RUN useradd -m myuser
USER myuser

CMD ["sh", "/start.sh"]

