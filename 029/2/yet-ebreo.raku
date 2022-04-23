#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle NativeCall' if $*VM ~~ /jvm/;

# Must first: gcc -shared -o fib.so fib.c
# for clarity: updated 'perl' as 'raku'

use NativeCall;
use experimental :cached;
sub fib(int32) returns int32 is native('fib.so') {*}

sub MAIN () {

    my $start = now;
    print (raku_fib($_)~" ") for 1..20;

    #say "\nRun Time (Perl): "~(now - $start)~" sec\n";
    say '';

    $start = now;
    print (raku_fib_cached($_)~" ") for 1..20;

    #say "\nRun Time (Perl-Cached): "~(now - $start)~" sec\n";
    say '';

    $start = now;
    print (fib($_)~" ") for 1..20;
 
    #say "\nRun Time: (NativeCall)"~(now - $start)~" sec\n";
    say '';
}

sub raku_fib($n)  { ($n == 0) ?? 0 !! ($n == 1) ?? 1 !! raku_fib($n-1)+raku_fib($n-2) }
sub raku_fib_cached($n) is cached { ($n == 0) ?? 0 !! ($n == 1) ?? 1 !! raku_fib_cached($n-1)+raku_fib_cached($n-2) }

