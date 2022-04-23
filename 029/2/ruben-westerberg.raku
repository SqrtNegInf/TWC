#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle NativeCall' if $*VM ~~ /jvm/;

use NativeCall;
sub getuid() returns uint32   is native { * };
put "User ID: "~getuid;
