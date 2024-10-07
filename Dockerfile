FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
RUN apt-get update -qq && apt-get install -y imagemagick libvips42

RUN mkdir /myapp
# コンテナ内にmyappディレクトリを作成

WORKDIR /myapp
# myappディレクトリを作業用ディレクトリとして指定

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
# コンテナ内におけるGemfileのbundle install

COPY . /myapp