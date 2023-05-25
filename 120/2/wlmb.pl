#!/usr/bin/env perl
use v5.36;

for( ('03:10', '12:55') ){
    say "Wrong format: $_", next
         unless $_=~m/^(\d?\d):(\d\d)$/
                && 0<=$1<=24 && 0<=$1<60; # <24?
    my $angle=(30*($1+$2/60)-$2*6)%360;
    $angle=360-$angle if $angle>180;
    say "Input: $_, Output: $angle";
}
