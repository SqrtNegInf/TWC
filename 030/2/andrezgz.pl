#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

series();

sub series {
    our %groups;
    if (@_ == 3) {
        my $key = join ' ', sort { $a <=> $b } @_;
        print $key.$/ if sum(@_) == 12 && !$groups{$key}++;
        return;
    }

    series(@_,$_) for ( 1..10 );

    return;
}
