package mw.expressbrute;

import haxe.extern.EitherType;
import express.*;

typedef MiddlewareOptions = {
  key : EitherType<String, Request -> Response -> Next -> Void>,
  ?failCallback : Request -> Response -> Next -> Date -> Void
}
