#!/usr/bin/env perl

use strict;
use warnings;

# Numbers are sorted in ascending order just in case
my @numbers = sort {$a <=> $b} split ',', '1,2,3,4,9,10,14,15,16';

my ($first, $last) = (shift @numbers) x 2;

foreach my $n (@numbers){
    if ($n - $last > 1) {
        print compact_term($first, $last).',';
        $first = $n;
    }
    $last = $n;
}

print compact_term($first, $last).$/;

# Returns a term for the compact form: a single number, two numbers (m,n) or a range (m-n)
sub compact_term {
    my ($first, $last) = @_;
    my $separator = ($last - $first == 1) ? ',' : '-';
    return ($last == $first) ? $first : $first.$separator.$last;
}
