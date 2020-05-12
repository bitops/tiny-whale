
# a simple ruby web app

FROM ruby

COPY server.rb /server.rb

EXPOSE 8080

CMD [ "ruby", "server.rb" ]
