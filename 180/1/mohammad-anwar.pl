#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is first_unique_character('Perl Weekly Challenge'), 0, 'Example 1';
is first_unique_character('Long Live Perl'),        1, 'Example 2';

done_testing;

#
#
# METHOD

sub first_unique_character($str) {
    my @c = ();
    my %c = ();
    foreach my $c (split //, $str) {
        next if $c eq ' ';
        $c = lc $c;
        if (exists $c{$c}) {
            $c{$c}++;
        }
        else {
            push @c, $c;
            $c{$c} = 1;
        }
    }

    my $i = 0;
    foreach my $c (@c) {
        if ($c{$c} == 1) {
            return $i;
        }
        $i++;
    }
}
