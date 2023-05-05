#!/usr/bin/env perl
use v5.36;

use Memoize;
memoize('totient');  #good idea, unless using GMP
#memoize('gcd');     #bad idea, runs slower

sub totient { my $n=shift; 0+grep gcd($_,$n)==1, 1..$n-1 }

sub gcd { my($a,$b)=@_;($a,$b)=($b,$a)if$a>$b;($a,$b)=($b%$a,$a)while$a;$b }

my $want = shift() // 20;
my $try = 1;
while( $want > 0 ){
    my $sum = 0;
    my $n = $try;
    $sum += $n = totient($n) while $n>1;
    print "$try\n" and $want-- if $sum == $try;
    $try+=2;
}

