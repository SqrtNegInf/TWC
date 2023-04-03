#!/usr/bin/env raku

# wrong answer?

sub MAIN( @list is copy where { @list.grep( * ~~ Int).elems == @list.elems } = <1 1 2 2 2 3 3> ) {

    my @removed;

    for 2 .. @list.max {
	next if @removed.grep( * == $_ );
	next if @removed.grep( * == ( $_ + 1 ) );
	next if @removed.grep( * == ( $_ - 1 ) );
	@removed.push: @list.grep( * == $_ ), @list.grep( * == ( $_ + 1 ) ), @list.grep( * == ( $_ - 1 ) );
    }

    @removed.sum.say;
}

