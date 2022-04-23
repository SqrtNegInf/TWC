#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle NativeCall' if $*VM ~~ /jvm/;
die 'not ok - disabled: as written runs only on Windows';

use NativeCall;

sub fib(int32)
    returns int32
    is native('./fibonacci.dll')
    { * }

sub fib-p6 (Int $num) {
    return 1 if $num == 0 or $num == 1;
    return fib-p6($num - 1) + fib-p6($num - 2);
}

sub MAIN (Int $num where * >= 0 = 36 ) {
    my $start-time = INIT now;
    say "C library function: ", fib($num);
    say "Duration C function: ", now - $start-time;
    my $now = now;
    say "P6 subroutine: ", fib-p6 $num;
    say "Duration P6 subroutine: ", now - $now;
}
