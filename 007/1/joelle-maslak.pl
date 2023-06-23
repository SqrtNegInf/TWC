#!/usr/bin/env perl
use v5.36;

if ( @ARGV > 1 )      { die("Provide letters to use and (optionally) filename") }
my $MAX = $ARGV[0] // 50;


MAIN: {
    for (my $i=1; $i<=$MAX; $i++) {  # We know via math that 0 is not Niven
        say $i if ! ($i % sum( [ split //, $i ]));
    }
}

sub sum($list) {
    my $sum = 0;
    foreach my $i (@$list) {
        $sum += $i;
    }
    return $sum;
}

