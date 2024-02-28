FROM ruby:3.2.2

WORKDIR /app

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev nodejs postgresql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && \
    bundle install --jobs 20 --retry 5

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
