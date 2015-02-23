import strutils, sockets, httpserver, threadpool, os

proc handleRequest(client: Socket, path, query: string): bool {.procvar.} =
  var parts = split(path, '/')
  client.send("ok")
  client.close
  discard spawn execShellCmd("./testcmd " & join(parts, " "))

run(handleRequest, Port(5000))

