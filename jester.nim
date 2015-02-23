import threadpool, jester, asyncdispatch, json, os

routes:
  get "/test":
    resp "Done"
    discard spawn execShellCmd("./testcmd")

  post "/":
    var push = parseJson(@"payload")
    resp "I got some JSON: " & $push
    echo(@"payload")
    echo("blah")
    #discard spawn execShellCmd("./testcmd") 


runForever()
