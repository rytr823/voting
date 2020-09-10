FROM ruby:2.6.5
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn
RUN mkdir /voting
WORKDIR /voting
COPY Gemfile /voting/Gemfile
COPY Gemfile.lock /voting/Gemfile.lock
RUN gem install bundler
RUN apk add --update nodejs nodejs-npm
RUN apk add --no-cache gmp-dev
RUN bundle install
COPY . /voting