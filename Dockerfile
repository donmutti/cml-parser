FROM ruby:latest
EXPOSE 4567
RUN mkdir /usr/src/app 
ADD . /usr/src/app/ 
WORKDIR /usr/src/app/ 
RUN gem install bundler && bundle install
CMD ["ruby", "/usr/src/app/cml_parser.rb"]
