#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

my $file = $ARGV[0] // $0;

open my $fh, '<', $file;
my @lines;
while (my $line = <$fh>) {
    chomp $line;
    push @lines, $line;
}
close $fh;

say join("\n", center(@lines));

sub center(@lines) {
    my $maxlen = max map { length($_) } @lines;
    return map { " " x (($maxlen - length($_))/2) . $_ } @lines;
}

