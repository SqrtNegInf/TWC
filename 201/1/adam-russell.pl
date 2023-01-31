#!/usr/bin/env perl
use v5.36;
use boolean;

sub missing_numbers{
    my @numbers = @_;
    my %h;
    do { $h{$_} = undef } for @numbers;
    my @missing = grep { !exists($h{$_}) } 0 .. @numbers;
    return @missing;
}

MAIN:{
    say q/(/ . join(q/, /, missing_numbers(0, 1, 3)) . q/)/;
    say q/(/ . join(q/, /, missing_numbers(0, 1)) . q/)/;
    say q/(/ . join(q/, /, missing_numbers(0, 1, 2, 2)) . q/)/;
}
