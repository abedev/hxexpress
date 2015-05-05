package mw.expressbrute;

import express.*;
import haxe.extern.EitherType;

typedef Options = {
/*
The number of retires the user has before they need to start waiting (default: 2)
*/
  ?freeRetries : Int,
/*
The initial wait time (in milliseconds) after the user runs out of retries (default: 500 milliseconds)
*/
  ?minWait : Float,
/*
The maximum amount of time (in milliseconds) between requests the user needs to wait (default: 15 minutes). The wait for a given request is determined by adding the time the user needed to wait for the previous two requests.
*/
  ?maxWait : Float,
/*
The length of time (in seconds since the last request) to remember the number of requests that have been made by an IP. By default it will be set to maxWait * the number of attempts before you hit maxWait to discourage simply waiting for the lifetime to expire before resuming an attack. With default values this is about 6 hours.
*/
  ?lifetime : Float,
/*
Gets called with (req, resp, next, nextValidRequestDate) when a request is rejected (default: ExpressBrute.FailForbidden)
*/
  ?failCallback : Request -> Response -> Next -> Date -> Void,
/*
Specifies how many levels of the X-Forwarded-For header to trust. If your web server is behind a CDN and/or load balancer you'll need to set this to however many levels of proxying it's behind to get a valid IP. Setting this too high allows attackers to get around brute force protection by spoofing the X-Forwarded-For header, so don't set it higher than you need to (default: 0)
*/
  ?proxyDepth : Int,
/*
Specify whether or not a simplified reset method should be attached at req.brute.reset. The simplified method takes only a callback, and resets all ExpressBrute middleware that was called on the current request. If multiple instances of ExpressBrute have middleware on the same request, only those with attachResetToRequest set to true will be reset (default: true)
*/
  ?attachResetToRequest : Bool,
/*
Defines whether the remaining lifetime of a counter should be based on the time since the last request (true) of the time since the first request (false). Useful for allowing limits over fixed periods of time, for example a limited number of requests per day. (Default: true)
*/
  ?refreshTimeoutOnRequest : Bool,
/*
Gets called whenever an error occurs with the persistent store from which ExpressBrute cannot recover. It is passed an object containing the properties message (a description of the message), parent (the error raised by the session store), and [key, ip] or [req, res, next] depending on whether or the error occurs during reset or in the middleware itself.
*/
  ?handleStoreError : EitherType<
    { message : String, parent : js.Error} -> String -> String -> Void,
    { message : String, parent : js.Error} -> Request -> Response -> Next -> Void
  >
}
