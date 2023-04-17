#!/usr/bin/env raku

#sub MAIN( *@args ) {
    my $word = 'raku';
    my @jumps = (24,4,7,17);
    my @alphabet = 'a' .. 'z';
    my @new-world;
    my $index = 0;
    for $word.lc.comb {
	next if ! $_;
	next if ! @alphabet.grep( * ~~ $_ );
	my $jump = @jumps.shift;
	my $idx = ( $jump + @alphabet.first( $_, :k ) ) % @alphabet.elems;
	@new-world.push: @alphabet[ $idx ];
    }

    @new-world.join.say;
#}
