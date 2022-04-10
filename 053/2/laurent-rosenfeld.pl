#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

my %successors = (
    a => ['e', 'i'],
    e => ['i'],
    i => [qw /a e o u/],
    o => ['a', 'u'],
    u => ['e', 'o']
);
my @vowels = sort keys %successors;
my $str_size = 3;

for my $start (@vowels) {
    make_str($str_size -1, $start, $start);
}

sub make_str {
    my ($left, $last, $string) = @_;
    say $string and return unless $left; # Stop the recursion
    for my $next (@{$successors{$last}}) {
        my $new_str = $string . $next;
        make_str($left -1, $next, $new_str);
    }
}
