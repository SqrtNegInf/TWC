#!/usr/bin/env perl
use v5.36;

use List::Util qw(min);

sub main {
    my @values  = @_;
    my @factors = ();

    my $min = min(@values);
  OUTER: foreach my $number ( 1 .. $min ) {
        foreach my $value (@values) {
            next OUTER if $value % $number;
        }

        push @factors, $number;
    }

    say join ', ', @factors;

}

main((100, 500));
