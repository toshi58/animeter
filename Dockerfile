FROM ruby:2.6.5
RUN apt-get update && apt-get install -y \
  build-essential && \
  gem install bundler --version='2.1.4' && \
  # yarnをインストール
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn && \
  # nodejsをインストール
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get update && apt-get install -y nodejs
WORKDIR /animeter
COPY Gemfile Gemfile.lock /animeter/
RUN bundle install