ARG  BASE_IMAGE=ruby:3.1.3-alpine3.17
FROM ${BASE_IMAGE}

RUN apk update && apk upgrade &&\
    apk add --update --no-cache build-base glib-dev exiftool libexif-dev expat-dev tiff-dev jpeg-dev libpng libgsf-dev vips git rsync lftp openssh perl &&\
    rm -rf /var/cache/apk/*

COPY ./ /photo-stream

WORKDIR /photo-stream

RUN ruby -v && gem install bundler jekyll &&\
    bundle config --local build.sassc --disable-march-tune-native &&\
    bundle install

EXPOSE 4000

ENTRYPOINT bundle exec jekyll serve --host 0.0.0.0
