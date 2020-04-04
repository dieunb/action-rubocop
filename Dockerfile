FROM ruby:2.6-alpine

ENV REVIEWDOG_VERSION v0.9.17

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --update --no-cache build-base git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ $REVIEWDOG_VERSION
RUN gem install -N rubocop rubocop-rails rubocop-rails_config rubocop-performance rubocop-rspec rubocop-i18n rubocop-rake

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
