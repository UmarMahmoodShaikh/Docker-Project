FROM ruby:3.0.0-alpine
RUN mkdir /docker_project
RUN apk add build-base
RUN apk add postgresql-dev=9.6.10-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.5/main
WORKDIR /docker_project
ADD Gemfile /docker_project/Gemfile
ADD Gemfile.lock /docker_project/Gemfile.lock
ADD . /docker_project
RUN bundle install
COPY . .

RUN rake assets:precompile
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
