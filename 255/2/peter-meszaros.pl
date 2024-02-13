#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;

my $cases = [
    ["Joe hit a ball, the hit ball flew far after it was hit.", "hit"],
    [ "Perl and Raku belong to the same family. Perl is the most popular language in the weekly challenge.", "the"],
];

sub most_frequent_word
{
    my ($p, $w) = @_;

    $p =~ s/[^a-z\s]//gi; # keep letters only
    my @w = split(/\s/, $p);
    my %stat;
    for (@w) {
        ++$stat{$_} unless $_ eq $w;
    }

    return (sort {$stat{$b} <=> $stat{$a}} keys %stat)[0];
}

is(most_frequent_word($cases->[0]->@*), 'ball',  'Example 1');
is(most_frequent_word($cases->[1]->@*), 'Perl',  'Example 2');
done_testing();
