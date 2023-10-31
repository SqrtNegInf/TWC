#!/usr/bin/env perl
use v5.36;

sub build_array{ 
    push @{$_[0]}, $_[$_[@{$_[0]} + 1] + 1];
    return $_[0] if @{$_[0]} == @_ - 1;
    goto __SUB__;
}

MAIN:{
    say join q/, /, @{build_array([], 0, 2, 1, 5, 3, 4)};
    say join q/, /, @{build_array([], 5, 0, 1, 2, 3, 4)};
}
