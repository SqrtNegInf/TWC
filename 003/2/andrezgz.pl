#!/usr/bin/env perl
use v5.36;

my $rows = $ARGV[0] || 10;

if ($rows < 3) {
    print "The Pascal Triangle should have at least 3 rows\n";
    $rows = 3;
}

my @row = (1);

while ($rows) {
    print join(' ',@row) .$/;
    $rows--;
    @row = map {$row[$_] += $row[$_+1]} 0..@row-2;
    unshift @row, 1;
    push @row, 1;
}
