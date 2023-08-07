#!/usr/bin/env raku

sub MAIN( @nums where { @nums.grep( * ~~ Int ).elems == @nums.elems } = (3, 4, 2) ) {
    my @current = @nums;
    my $moves = 0;

    while ( @current ) {
	my $swap = @current.shift;
	@current.push: $swap  if $swap > @current.min;
	$moves++;
    }

    $moves.say;
}
