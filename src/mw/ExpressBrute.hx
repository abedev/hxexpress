package mw;

import mw.expressbrute.*;
import express.*;

@:jsRequire("express-brute")
extern class ExpressBrute {
/*
Terminates the request and responses with a 429 (Too Many Requests) error that has a Retry-After header and a JSON error message.
*/
  static function FailTooManyRequests(req : Request, res : Response, next : Next, nextValidRequestDate : Date) : Void;

/*
Terminates the request and responds with a 403 (Forbidden) error that has a Retry-After header and a JSON error message. This is provided for compatibility with ExpressBrute versions prior to v0.5.0, for new users FailTooManyRequests is the preferred behavior.
*/
  static function FailForbidden(req : Request, res : Response, next : Next, nextValidRequestDate : Date) : Void;

/*
Sets res.nextValidRequestDate, the Retry-After header and the res.status=429, then calls next() to pass the request on to the appropriate routes.
*/
  static function FailMark(req : Request, res : Response, next : Next, nextValidRequestDate : Date) : Void;

  function new(store : Store, ?options : Options) : Void;

/*
Middleware that will bounce requests that happen faster than the current wait time by calling failCallback. Equivilent to getMiddleware(null)
*/
  function prevent(req : Request, res : Response, next : Next) : Void;
/*
Generates middleware that will bounce requests with the same key and IP address that happen faster than the current wait time by calling failCallback. Also attaches a function at req.brute.reset that can be called to reset the counter for the current ip and key. This functions the the reset instance method, but without the need to explicitly pass the ip and key parameters
  * `key` can be a string or alternatively it can be a function(req, res, next) that calls next, passing a string as the first parameter.
  * `failCallback` Allows you to override the value of failCallback for this middleware
*/
  function getMiddleware(options : MiddlewareOptions) : Middleware;

/*
Resets the wait time between requests back to its initial value. You can pass `null` for key if you want to reset a request protected by `protect`.
*/
  function reset(ip : String, key : String, next : Next)  : Void;

/*
Uses the current proxy trust settings to get the current IP from a request object
*/
  function getIPFromRequest(req : Request) : String;
}
