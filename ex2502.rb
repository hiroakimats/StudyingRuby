require 'WEBrick'
require 'date'


config = {
    :Port => 1020,
    :DocumentRoot => '.'
}

server = WEBrick::HTTPServer.new(config)

server.mount_proc("/testprog") {|req, res|
  res.body << "<html><body><p>アクセスした日付は#{Date.today.to_s}です。</p>"
  res.body << "<p>リクエストのパスは#{req.path}でした</p>"
  res.body << "<ul>"
  req.each{ |key, value|
    res.body << "<li>#{key}:#{value}</li>"
  }
  res.body << "</ul>"
  res.body << "</body></html>"
}


server.shutdown


