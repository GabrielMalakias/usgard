FROM ruby:2.4.0

RUN mkdir /usgard
WORKDIR /usgard

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

ADD . /usgard
