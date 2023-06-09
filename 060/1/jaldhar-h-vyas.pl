#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub columnToNum {
    my ($column) = @_;
    my @chars = reverse split //, $column;
    my $output = 0;

    for my $i (0 .. scalar @chars - 1) {
        $output +=
            (ord($chars[$i]) - ord('A') + 1) * 26 ** $i;
    }
    return $output;
}

sub numToColumn {
    my ($num) = @_;
    my $output = 'A';

    for (1 ..  $num - 1) {
        $output++;
    }
    return $output;
}

my $arg = 28;

if ($arg =~ /^[A-Z]+$/) {
    say columnToNum($arg);
} elsif ($arg =~ /^[0-9]+$/ && $arg > 0) {
    say numToColumn($arg);
} else {
    usage();
}
