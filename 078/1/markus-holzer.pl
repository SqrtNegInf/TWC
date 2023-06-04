#!/usr/bin/env perl
use v5.36;

my @ARGV = <9 10 7 5 6 1>;

say join "> ", @ARGV;
say join ", ", leader_elements( @ARGV );
 
sub leader_elements {
    my $first = my $max = pop @_;
    defined $first
        ? reverse $first, grep { $_ > $max ? [$max = $_] : 0 } reverse @_
        : 0 }
