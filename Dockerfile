# Base image with ruby 2.2.0
FROM ruby:2.2.0

# Install required libraries and dependencies
RUN apt-get update && apt-get install -qy mysql-client build-essential vim sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Create directory from where the code will run
RUN mkdir -p /whaler-api
RUN mkdir -p /whaler-ui
WORKDIR /tmp

COPY Whaler-api/Gemfile Gemfile
COPY Whaler-api/Gemfile.lock Gemfile.lock

# Install the necessary gems
RUN bundle install # --without development test

# Add rails project (from same dir as Dockerfile) to project directory
ADD ./Whaler-api/ /whaler-api
ADD ./Whaler-ui/ /whaler-ui
WORKDIR /whaler-api

# Run rake tasks
#RUN RAILS_ENV=development rake db:create db:migrate
#RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
RUN RAILS_ENV=development bundle exec rake assets:precompile --trace
CMD ["rails","server","-b","0.0.0.0","-p","3000"]

WORKDIR /whaler-ui
RUN bundle install # --without development test
# Run rake tasks
#RUN RAILS_ENV=development rake db:create db:migrate
#RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
RUN RAILS_ENV=development bundle exec rake assets:precompile --trace
CMD ["rails","server","-b","0.0.0.0","-p","8080"]
