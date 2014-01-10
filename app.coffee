fs = require 'fs'
{parse} = require 'url'

toPretty = (obj) -> (JSON.stringify obj, null, 4)

formatReqestToString = (req) ->
  s1 =
    "readable:         #{req.readable                       }\n" +
    "domain:           #{req.domain                         }\n" +
    "httpVersion:      #{req.httpVersion                    }\n" +
    "complete:         #{req.complete                       }\n" +
    "headers:          #{toPretty req.headers               }\n" +
    "trailers:         #{toPretty req.trailers              }\n" +
    "url:              #{req.url                            }\n" +
    "method:           #{req.method                         }\n" +
    "statusCode:       #{req.statusCode                     }\n" +
    "httpVersionMajor: #{req.httpVersionMajor               }\n" +
    "httpVersionMinor: #{req.httpVersionMinor               }\n" +
    "upgrade:          #{req.upgrade                        }\n" +
    "query:            #{toPretty parse(req.url, true).query}\n"

handler = (req, res) ->
  if /^\/(index(.html)?)?$/.test req.url
    fs.readFile "#{__dirname}/index.html", (err, data) ->
      if err
        res.writeHead 500
        res.end 'Error loading index.html'
        return
      res.writeHead 200
      res.end data
      return
    return
  else
    io.sockets.emit 'prepend-log', (formatReqestToString req)
    res.writeHead 200
    res.end 'Success'
    return

app = (require 'http').createServer handler
io = (require 'socket.io').listen app

app.listen (process.env.PORT || 8080)
