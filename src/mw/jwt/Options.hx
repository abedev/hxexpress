package mw.jwt;

import express.Request;

typedef Options = {
  ?userProperty : String,
  ?credentialsRequired : Bool,
  ?getToken : Request -> String,
  ?secret : String
}
