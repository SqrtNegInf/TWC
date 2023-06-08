#!/usr/bin/env perl
use v5.36;

use Math::Combinatorics;
use List::Util qw{sum};

my $S = "perlweeklychallenge";
my @W = ("weekly", "challenge", "perl");

my $target = length $S;

my $noofsoln = 0;

for my $r (1..$#W+1) {
    my $subject = Math::Combinatorics->new( count => $r , data => [@W] );
    while (my @tsum = $subject->next_combination) {
        if ($target == sum map {length $_} @tsum) {
            my $psubject = Math::Combinatorics->new( count => $r, data => [@tsum]);
            while (my @ptsum = $psubject->next_permutation) {
                if ( $S eq (join "", @ptsum)) {
                    print "\"";
                    print join "\",\"", @ptsum;
                    print "\"\n";
                    $noofsoln++;
                }
            }
        }
    }
}

print "0\n" if $noofsoln == 0;
