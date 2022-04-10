#!/usr/bin/env raku

sub MAIN() {

    # Brute force calculate collatz
    my %lengths;
    for (1 .. 10000) -> $i {
    	my $length = collatz($i);
    	%lengths{$i} = $length
    		if ($length > 1);
    }

    # Grab the 22 longest numbers
    my @keys = %lengths.keys.sort(
    	{ %lengths.{$^b} <=> %lengths.{$^a} }
    ).[0 .. 5];

    # Output the lengths
    for ( @keys ) -> $i {
    	say "$i : Length " ~ %lengths{$i};
    }
}

#Calculate collatz
sub collatz($n is copy) {
    my $length = 0;

    while ($n != 1) {
    	$length++;

    	$n = ($n % 2) ??
    		3 * $n + 1  !!
    		$n / 2;
    }

    return $length.Int;
}
