#!/usr/bin/env perl
use v5.36;
use warnings;
use strict;
use feature qw{ say };

my %next = (
    a => [qw[ e i ]],
    e => [qw[ i ]],
    i => [qw[ a e o u ]],
    o => [qw[ a u ]],
    u => [qw[ o e ]]);

my $n = 3;
die "Invalid argument" unless ($n // "") =~ /^[1-5]$/;

my @agenda = sort keys %next;

while ($n > length $agenda[0]) {
    my @next;
    for my $string (@agenda) {
        my $last = substr $string, -1;
        push @next, map $string . $_, @{ $next{$last} };
    }
    @agenda = @next;
}
say for @agenda;
