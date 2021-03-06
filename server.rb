require 'webrick'
require 'erb'

HTML = ERB.new(DATA.read).result(binding)

class Simple < WEBrick::HTTPServlet::AbstractServlet
  def do_GET request, response
    response.status = 200
    response['Content-Type'] = 'text/html'
    response.body = HTML
  end
end

server = WEBrick::HTTPServer.new :Port => 8080
server.mount '/', Simple

trap 'INT' do
  server.shutdown
end

server.start

__END__
<!DOCTYPE html>
<html>
  <head>
    <title>a tiny whale</title>
  </head>
  <body style="background-color: <%= ENV['COLOR'] %>">
    <div>
      <p>
        &#128011;
      </p>
    </div>
  </body>
</html>
