package mw.bodyparser;

import express.Request;
import express.Response;
import haxe.EitherType;
import js.node.Buffer;

typedef RawOptions = {
  ?inflate : Bool,
  // in bytes https://www.npmjs.com/package/bytes
  // TODO can use abstract
  ?limit : EitherType<String, Int>,
  ?type : EitherType<String, Request -> Bool>,
  ?verify : Request -> Response -> Buffer -> String -> Void
}
