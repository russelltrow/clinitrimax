FROM ruby

MAINTAINER Russell Trow <russell@dockleafdigital.com>

ENV BUILD_PACKAGES build-essential libpq-dev nodejs

RUN apt-get update -qq && \
    apt-get install -y $BUILD_PACKAGES

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.license="MIT" \
      org.label-schema.name="Clinitrixmax" \
      org.label-schema.url="https://www.clinitrixmax.com/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/russelltrow/clinitrimax.git"

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile
RUN bundle install

COPY . .