FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /ipuc_sm
WORKDIR /ipuc_sm
COPY Gemfile /ipuc_sm/Gemfile
COPY Gemfile.lock /ipuc_sm/Gemfile.lock
RUN bundle install
COPY . /ipuc_sm

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
