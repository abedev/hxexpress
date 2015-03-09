package mw.bodyparser;

import express.Request;
import express.Response;
import haxe.extern.EitherType;
import js.node.Buffer;

typedef RawOptions = {
  ?inflate : Bool,
  ?limit : EitherType<String, Int>,
  ?type : EitherType<String, Request -> Bool>,
  ?verify : Request -> Response -> Buffer -> String -> Void
}
