#!/usr/bin/env raku

#sub MAIN( *@list where { @list.grep( * ~~ Int ).elems == @list.elems } ) {
my @list = (1,1,2,2,6,6);
    my $bag = @list.grep( * %% 2 ).Bag;
    my $most-frequency = $bag.values.max;
    my @most-frequent-evens;
    for $bag.keys {
	next if $bag{ $_ } != $most-frequency;
	@most-frequent-evens.push: $_;
    }

    @most-frequent-evens.min.say;
#}
