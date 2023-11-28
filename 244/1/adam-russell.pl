#!/usr/bin/env perl
use v5.36;

sub count_smaller{
    my @integers = @_;
    my @integers_sorted = sort {$a <=> $b} @integers;
    return map {  
        my $x = $_;
        (grep { $integers[$x] == $integers_sorted[$_]} 0 .. @integers_sorted - 1)[0];
    } 0 .. @integers - 1;
}

MAIN:{
    say join q/, /, count_smaller qw/8 1 2 2 3/;
    say join q/, /, count_smaller qw/6 5 4 8/;
    say join q/, /, count_smaller qw/2 2 2/;
}
