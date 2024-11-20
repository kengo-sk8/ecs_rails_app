ARG RUBY_VERSION=3.3
ARG RUBYGEMS_VERSION=3.5.23

FROM ruby:${RUBY_VERSION}

ENV LANG=C.UTF-8 \ 
    TZ=Asia/Tokyo \ 
    RUBY_YJIT_ENABLE=1 \
    RAILS_ENV=production

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/log/* /var/cache/debconf/*

WORKDIR /web1

COPY Gemfile Gemfile.lock /web1/
RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

COPY . .       

# Add a script to be executed every time the container starts.
COPY config/entrypoint.sh /usr/bin/
RUN chmod 744 /usr/bin/entrypoint.sh

# master.keyをコピー
RUN --mount=type=secret,id=master_key,target=master.key,required=true \
    rails assets:precompile RAILS_ENV=production

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# デフォルトのメインプロセスを指定
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
