FROM ruby:3.2.2

RUN apt-get update && apt-get install -y \
    git \
    vim \
    zip \
    unzip \
    autoconf \
    gcc \
    g++ \
    make \
    curl \
    gnupg \
    vim \
    build-essential \
    nodejs \
    postgresql-client \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

RUN mkdir /web1
WORKDIR /web1

COPY Gemfile /web1/
COPY Gemfile.lock /web1/Gemfile.lock

ARG RUBYGEMS_VERSION=3.4.15

RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

# Add a script to be executed every time the container starts.
COPY conf/entrypoint.sh /usr/bin/
RUN chmod 744 /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
