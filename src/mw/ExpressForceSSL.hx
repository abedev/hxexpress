package mw;

import mw.expressforcessl.*;
import express.*;

@:jsRequire("express-force-ssl")
extern class ExpressForceSSL {
  @:selfCall static var instance(default, null) : Middleware;
}
