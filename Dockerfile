
# a simple ruby web app

FROM ruby

ARG GITHASH
RUN echo "$GITHASH" > /version.txt

COPY server.rb /server.rb

EXPOSE 8080

CMD [ "ruby", "server.rb" ]
