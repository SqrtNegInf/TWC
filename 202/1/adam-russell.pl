#!/usr/bin/env perl
use v5.36;

use boolean;

sub three_consecutive_odds{
    my @numbers = @_;
    my $consecutive_odds = 0;
    {
        my $x = pop @numbers;
        $consecutive_odds++   if 1 == ($x & 1);
        $consecutive_odds = 0 if 0 == ($x & 1);
        return true if 3 == $consecutive_odds;
        redo if @numbers;
    }
    return false;
}

MAIN:{
    say three_consecutive_odds(1, 5, 3, 6);
    say three_consecutive_odds(2, 6, 3, 5);
    say three_consecutive_odds(1, 2, 3, 4);
    say three_consecutive_odds(2, 3, 5, 7);
}
