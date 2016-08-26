FROM rails:4

ENV RAILS_ENV=development
ENV POSTGRES_USERNAME=postgres

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install -j 20
CMD rails s -b 0.0.0.0
