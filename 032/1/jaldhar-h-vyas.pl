#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;
use Getopt::Long;

my $csv = 0;

my @contents;
    for my $file ('example.txt') {
        open my $fh, '<', $file or die "$OS_ERROR\n";
        local $INPUT_RECORD_SEPARATOR = undef;
        push @contents, split /\n/, <$fh>;
        close $fh;
    }

my %totals;
for my $item (@contents) {
    chomp $item;
    $totals{$item}++;
}

if ($csv) {
    for my $total (sort keys %totals) {
        say "$total,$totals{$total}";
    }
} else {
    my $width =
        length ((sort {length $b <=> length $a} keys %totals)[0]);

    for my $total (sort keys %totals) {
        printf("% -*s  %s\n", $width, $total, $totals{$total});
    }
}
