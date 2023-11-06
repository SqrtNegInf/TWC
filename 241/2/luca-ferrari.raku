#!/usr/bin/env raku


sub prime_factors (Int $n) {
    return $n if $n <= 1;
    my $residue = $n;
    my @factors;

    for 2 .. $n {
	while ( $residue %% $_ ) {
	    @factors.push: $_;
	    $residue /= $_;
	}

	last if $residue == 1;
    }

    return @factors;
}

sub MAIN( @nums where { @nums.grep( * ~~Int ).elems == @nums.elems } = (11,8,27,4) ) {
    my %sorted;
    for @nums {
	%sorted{ prime_factors( $_.Int ).elems }.push: $_;
    }

    %sorted{ $_ }.join( "," ).say for  %sorted.keys.sort;
}
