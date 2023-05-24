#!/usr/bin/env perl
use v5.36;

use List::Util qw(pairs);
use POSIX qw(round);

foreach(pairs (12, 3) ){
    my ($n,$b)=map {round $_} @$_; # Assure integer
    say("Wrong range: 0<=$n<=255 && 1<=$b<=8?"), next
        unless 0<=$n<=255 && 1<=$b<=8; # ??
    my $r=(1<<($b-1))^$n; # Count bits from 1, not 0
    say "Number: $n, Bit: $b, Output: $r";
}
