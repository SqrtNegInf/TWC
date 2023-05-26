#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    chomp;
    if (/^9+$/) {
        say $_ + 2;
        next;
    }

    if (length ($_) == 1) {
        say $_ + 1;
        next;
    }

    #
    # Split the number into parts 2 equal parts, with a middle part
    # of at most one digit.
    #
    my $part1 = substr $_, 0, int length ($_) / 2;
    my $part2 = substr $_,    int length ($_) / 2,  length ($_) % 2;
    my $part3 = substr $_,    int length ($_) / 2 + length ($_) % 2;

    if (reverse ($part1) <= $part3) {
        $part1 = "$part1$part2" + 1;
        $part2 = chop $part1 if length $part2;
    }
    say $part1, $part2, scalar reverse ($part1);
}

__END__
1234
999
