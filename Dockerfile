FROM ruby:2.3.3

RUN mkdir /space_wing
WORKDIR /space_wing

ADD Gemfile .
ADD Gemfile.lock .

RUN bundle install

ADD . /space_wing
