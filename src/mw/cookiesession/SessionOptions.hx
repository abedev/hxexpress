package mw.cookiesession;

import express.Request;
import express.Response;

typedef SessionOptions = {
  ?name : String,
  ?keys : Array<String>,
  ?secret : String
}
