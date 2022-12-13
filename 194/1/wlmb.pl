#!/usr/bin/env perl
use v5.36;

L: for my $in('2?:00'){
    for(reverse(0..9)){
        my $y=$in;
        $y=~s/\?/$_/;
        say("Wrong format $in"), next L unless $y=~/(\d\d):(\d\d)/;
        say("$in -> $_"), next L if $1<=23 and $2<=59
    }
    say "$in -> No solution";
}
