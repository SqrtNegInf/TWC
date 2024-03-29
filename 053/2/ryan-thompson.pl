#!/usr/bin/env perl
use v5.36;

# Follow rules. Basically graph edges.
my %edges = ( a => ['i','e'],  e => ['i'],    i => ['u','o','e','a'],
              o => ['u','a'],  u => ['e','o'] );

# Builds vowel strings using BFS with queue
sub vowel_string {
    my ($len) = @_;
    my @queue = sort keys %edges; # Pre-load queue

    my @vstrs;
    while (my $str = shift @queue) {
        push @vstrs, $str    and next if $len <= length $str;
        push @queue, $str.$_ for @{$edges{ substr $str, -1 }}
    }
    @vstrs;
}

# Iterator version
sub vowel_iter {
    my ($len) = @_;
    my @queue = sort keys %edges;
    sub {
        while (my $str = shift @queue) {
            return $str if $len <= length $str;
            push @queue, $str.$_ for @{$edges{ substr $str, -1 }}
        }
    }
}

say for vowel_string(3);

my $it = vowel_iter(3);
say while $_ = $it->();
