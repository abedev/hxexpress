package mw;

import mw.expressbrute.*;

@:jsRequire("express-brute")
extern class ExpressBrute {
  function new(store : Store, ?options : Options) : Void;
}
