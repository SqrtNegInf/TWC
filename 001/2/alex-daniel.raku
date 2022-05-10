#!/usr/bin/env raku
@=1…{put ‘Fizz’x$_%%3~‘Buzz’x$_%%5||$_}&20;
