#!/usr/bin/env perl
use v5.36;

my $MIN = 234;
my $MAX = 987;

LOOP:
for (my $i = $MIN; $i <= $MAX; ++$i) {
    my %seen = ();
    my @d = (split //, $i );

    foreach ( $d[0], $d[1], $d[2], $d[0]*$d[1], $d[1]*$d[2], $d[0]*$d[1]*$d[2]) {

        exists $seen{$_} ? next LOOP : $seen{$_}++ ;

    }
    print "$i\n";
}
