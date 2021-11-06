FROM ruby:3.0

ENV BUNDLER_VERSION=2.1.4

RUN apt-get update -y && apt-get install -y
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
    nodejs \
    yarn \
    vim \
    default-mysql-client

RUN gem install bundler -v $BUNDLER_VERSION

WORKDIR /app-server
