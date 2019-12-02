FROM ruby:2.4-alpine

ENV APP_DIR=/app
ENV RACK_ENV production

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
COPY Gemfile* app.rb /app/

RUN gem install bundler && bundle install --without development test
EXPOSE 4567

CMD ["bundle", "exec", "ruby", "app.rb"]
