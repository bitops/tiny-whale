
# a simple ruby web app

FROM ruby:2.7.4

ARG GITHASH=unspecified
RUN echo "$GITHASH" > /version.txt

COPY server.rb /server.rb

EXPOSE 8080

CMD [ "ruby", "server.rb" ]
