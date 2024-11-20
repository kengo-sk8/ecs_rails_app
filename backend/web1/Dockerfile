ARG RUBY_VERSION=3.3.6
ARG RUBYGEMS_VERSION=3.5.23

FROM ruby:${RUBY_VERSION}-slim-bookworm

ENV LANG=C.UTF-8 \ 
    TZ=Asia/Tokyo \ 
    RUBY_YJIT_ENABLE=1 \
    RAILS_ENV=development \ 
    WEB_APP_ROOT=/web1

RUN apt-get update -qq && apt-get install -y \ 
    build-essential \ 
    git \
    zip \
    unzip \
    autoconf \
    gcc \
    g++ \
    make \
    curl \
    gnupg \
    vim \
    bash \
    build-essential \
    nodejs \
    postgresql-client \
    libpq-dev \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/*

WORKDIR ${WEB_APP_ROOT}

COPY Gemfile Gemfile.lock ./
RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

COPY . .

VOLUME ${WEB_APP_ROOT}/tmp

COPY settings/entrypoint.sh /usr/bin/
RUN chmod 744 /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]