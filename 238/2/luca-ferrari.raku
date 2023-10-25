#!/usr/bin/env raku

sub MAIN( @nums where { @nums.grep( { $_ ~~ Int && $_ > 0 } ).elems == @nums.elems } =  (15, 99, 1, 34) ) {
    my %steps;
    for @nums {
	my $step-counter = 0;
	my $value = $_;
	while ( $value > 9 ) {
	    $value = [×] $value.comb;
	    $step-counter++;
	}

	%steps{ $step-counter }.push: $_;
    }

    my @running-sort.push: | %steps{ $_ }.sort for %steps.keys.sort;
    @running-sort.join( ', ' ).say;

}
