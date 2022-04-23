#!/usr/bin/env perl6

BEGIN die 'not ok - disabled: JVM cannot handle NativeCall' if $*VM ~~ /jvm/;

use NativeCall;

sub c_strlen(Str $str) returns int32 is native('c') is symbol('strlen') {*}

say c_strlen('abcdefg');
