FROM ruby:2.4.0-alpine

WORKDIR /chat

RUN apk --update add --virtual build-dependencies build-base ruby-dev libxml2-dev libxslt-dev \
        nodejs tzdata bash supervisor nginx git postgresql-dev

COPY Gemfile ./
COPY Gemfile.lock ./

RUN bundle install --without development test

COPY . ./

RUN RAILS_ENV=production bundle exec rake assets:precompile

COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY docker/nginx.conf /etc/nginx/nginx.conf
COPY docker/puma.sh ./
COPY docker/sidekiq.sh ./

RUN chmod 755 /chat/puma.sh
RUN chmod 755 /chat/sidekiq.sh
RUN mkdir -p /chat/tmp/sockets
RUN mkdir -p /chat/tmp/pids

ENV RAILS_ENV production

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]