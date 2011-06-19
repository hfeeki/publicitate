Publicitate - An ad server written in Erlang (relies on Nitrogen/Inets)
===================================================================================
This is the base code for an ad server I began writing in Erlang that I then discontinued
in favor of a Node.js approach.

Why is this?

You see, Erlang is a cool language, and I'd love to be able to play with it more. The problem,
though, is that Erlang is not a language that's really suited towards web applications; the environment
and data types just push against you for the most common tasks.

It's very possible that Erlang can provide incredible performance - I have not nor will I ever deny this;
what I'd like to stipulate is that most people who compare Erlang/Node.js/etc seem to overlook a very
common issue, which is maturity in an ecosystem. If we were to compare a Lua environment to a standard Python 
environment (e.g, no event based aspect, etc), Python will win hands down, because Lua is not an expansive environment
nor will you get enough of a performance gain to put up with the headaches involved.

In the event-based programming world, this is the case with Erlang/Node.js/etc - Erlang is woefully inadequate in the 
sense of an active web-framework ecosystem; Node, for all the fanboy-esque hype it gets, has come much further along in
this regard than Erlang ever has.

tl;dr Please use Node unless you have a damn good use case for Erlang.


Nice rant... what's the license/etc here?
--------------------------------------------------------------------------------
I'm explicitly choosing to release this without a license behind it at all; I will
most likely never touch this code again, but I figure it's possible someone could pick
something out of it, so why not share it?
