import strutils, sockets, httpserver, threadpool, os

var secret = 'JIY234lksOIJOkX923sA';

proc handleRequest(client: Socket, path, query: string): bool {.procvar.} =
  var parts = split(path, '/')
  if parts[0] == secret:
    client.send("ok")
    client.close
    discard spawn execShellCmd("./createserver " & join(parts, " "))

run(handleRequest, Port(5000))

