#!/usr/bin/env perl
use v5.36;

# Brute force calculate collatz
my %lengths;
for my $i (1 .. 10000) {
    my $length = collatz($i);
    $lengths{$i} = $length
    	if ($length > 10);
}

# Grab the 22 longest numbers
my @keys = (
    sort {
    	$lengths{$b} <=> $lengths{$a}
    } keys %lengths
)[0 .. 5] ;

for my $i ( @keys ) {
    say "$i : Length " . $lengths{$i};
}

#Calculate collatz
sub collatz {
    my $n = shift;
    my $length = 0;

    while ($n != 1) {
    	$length++;

    	$n = ($n % 2) ?
    		3 * $n + 1  :
    		$n / 2;
    }

    return $length;
}
