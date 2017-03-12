# Base image with ruby 2.2.0
FROM ruby:2.2.0-alpine


RUN mkdir -p /whaler-api
RUN mkdir -p /whaler-ui
RUN mkdir -p /whaler-logs

COPY whaler-api/Gemfile /whaler-api/Gemfile
COPY whaler-api/Gemfile.lock /whaler-api/Gemfile.lock

COPY whaler-ui/Gemfile /whaler-ui/Gemfile
COPY whaler-ui/Gemfile.lock /whaler-ui/Gemfile.lock

COPY whaler-logs/Gemfile /whaler-logs/Gemfile
COPY whaler-logs/Gemfile.lock /whaler-logs/Gemfile.lock

# Install the necessary gems
RUN bundle install --gemfile=/whaler-api/Gemfile \
    && bundle install --gemfile=/whaler-ui/Gemfile \
    && bundle install --gemfile=/whaler-logs/Gemfile
