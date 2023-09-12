#!/usr/bin/env raku

sub MAIN( @nums where { @nums.elems == @nums.grep( * ~~ Int ) } = (1,1,2,2,2,3) ) {
    my %sorting;
    for @nums -> $current {
	my $frequency = @nums.grep( * == $current ).elems;
	%sorting{ $frequency } //= Array.new;
	%sorting{ $frequency }.push: $current if ( ! %sorting{ $frequency }.grep( * == $current ) );
    }

    %sorting{ $_ }.sort.join( ',' ).say for %sorting.keys.sort;

}
