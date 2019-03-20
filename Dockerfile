FROM ruby:2.4.1-alpine

ENV LANG C.UTF-8
ENV RAILS_ENV=development

RUN apk add --update --no-cache --virtual=builders \
      alpine-sdk build-base linux-headers ruby-dev zlib-dev postgresql-dev nodejs 
RUN apk add --update --no-cache \
      libc6-compat libc-dev zlib ruby-json tzdata yaml less curl postgresql

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
