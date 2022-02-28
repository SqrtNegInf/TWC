#!/usr/bin/env raku

sub squareRoot(Int $n) {
    my $firstTry = $n +> 1;

    if $firstTry {
        my $nextTry = ( $firstTry + $n / $firstTry) +> 1;

        while $nextTry < $firstTry {
            $firstTry = $nextTry;
            $nextTry = ( $firstTry + $n / $firstTry) +> 1;
        }

		return $firstTry;
	} else {
		return $n;
	}
}

sub MAIN(
    Int $n  = 10 #= an integer
) {
    say squareRoot($n);
}
