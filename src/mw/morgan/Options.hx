package mw.morgan;

import express.Request;
import express.Response;

typedef Options = {
  ?immediate : Bool,
  ?skip : Request -> Response -> Bool,
  ?stream : js.node.fs.WriteStream
}
