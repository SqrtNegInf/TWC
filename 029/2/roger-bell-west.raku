#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle NativeCall' if $*VM ~~ /jvm/;

use NativeCall;

#our sub cpf(Str, Str --> int32) is native(sub{'libc.so.6'}) is symbol('printf') { * }
our sub cpf(Str, Str --> int32) is native(sub{'libc.dylib'}) is symbol('printf') { * }

cpf("%s\n",'a string passed from perl6');
