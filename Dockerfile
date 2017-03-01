FROM ruby:2.3.3

RUN mkdir /usgard
WORKDIR /usgard

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

ADD . /usgard
