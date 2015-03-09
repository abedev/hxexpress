package mw.cors;

import express.Request;
import haxe.extern.EitherType;
import js.Error;

typedef Options = {
  ?origin : EitherType<Bool, EitherType<String, OriginFunction>>,
  ?methods : EitherType<String, Array<String>>,
  ?allowedHeaders : EitherType<String, Array<String>>,
  ?exposedHeaders : EitherType<String, Array<String>>,
  ?credentials : Bool,
  ?maxAge : Int
}

typedef OriginFunction = String -> (Error -> Bool -> Void) -> Void;