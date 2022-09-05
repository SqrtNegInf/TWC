#!/usr/bin/env perl
use v5.36;

sub index_first_unique{
    my($s) = @_;
    my @s = split(//, $s);
    map {my $i = $_; my $c = $s[$i]; return $_ if 1 == grep {$c eq $_ } @s } 0 .. @s - 1;
}

MAIN:{
    say index_first_unique(q/Perl Weekly Challenge/);
    say index_first_unique(q/Long Live Perl/);
}
