#!/usr/bin/env perl
use v5.36;

my @S1 = (1, 2, 5, 3, 4);
my @S2 = (4, 6, 7, 8, 9);

say disjoint(\@S1, \@S2);

sub disjoint ($s1, $s2) {
    my %sethash = map { $_ => undef } $s1->@*;

    for my $member ( @S2 ) {
        return 0 if exists $sethash{"$member"};
    }   
    return 1;
}




