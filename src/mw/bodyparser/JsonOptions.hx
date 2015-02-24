package mw.bodyparser;

typedef JsonOptions = {> RawOptions,
  ?reviver : String -> Dynamic -> Dynamic,
  ?strict : Bool,
}
