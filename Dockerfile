FROM ruby:2.5
COPY project /app
WORKDIR /app
RUN gem install bundler && bundle install --jobs 20 --retry 5
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"] 
