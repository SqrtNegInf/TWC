#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
    [[["Perl", "is", "my", "friend"],
      ["Perl", "and", "Raku", "are", "friend"]
     ], 2],
    [[["Perl", "and", "Python", "are", "very", "similar"],
      ["Python", "is", "top", "in", "guest", "languages"]
     ], 1],
    [[["Perl", "is", "imperative", "Lisp", "is", "functional"],
      ["Crystal", "is", "similar", "to", "Ruby"]
     ], 0],
];

sub count_common
{
    my $w1 = $_[0]->[0];
    my $w2 = $_[0]->[1];

    my %h;
    for (@$w1) {
        if (exists $h{$_}) {
           $h{$_} = -1; 
        } else {
           $h{$_}++;
        }
    }
    for (@$w2) {
        $h{$_}++ if exists $h{$_} and $h{$_} == 1;
    }

    return scalar grep {$_ == 2} values %h;
}

for (@$cases) {
    is(count_common($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;
