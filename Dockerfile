FROM rails:4

ENV RAILS_ENV=development

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install
CMD rails s -b 0.0.0.0
