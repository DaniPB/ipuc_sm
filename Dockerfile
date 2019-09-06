FROM ruby:2.5.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /ipuc_sm
WORKDIR /ipuc_sm
COPY Gemfile /ipuc_sm/Gemfile
COPY Gemfile.lock /ipuc_sm/Gemfile.lock
RUN gem install bundler
COPY . /ipuc_sm

# Add a script to be executed every time the container starts.
COPY docker_entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker_entrypoint
ENTRYPOINT ["docker_entrypoint"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
