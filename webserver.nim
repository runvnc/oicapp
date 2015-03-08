import strutils, sockets, httpserver, threadpool, os

var secret = "JIY234lksOIJOkX923sA";

proc handleRequest(client: Socket, path, query: string): bool {.procvar.} =
  echo(path);
  var parts = split(path, '/')
  if parts[1] == secret:
    echo("request ok");
    client.send("ok")
    client.close
    discard spawn execShellCmd("./createserver " & join(parts[2..5], " "))

run(handleRequest, Port(6001))

