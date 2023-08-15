#!/usr/bin/env raku

#sub MAIN( *@words is copy ) {
my @words = ("abc", "bce", "cae");
    my $deleted = 0;

    for 0 ..^ @words.elems {
	my $word = @words[ $_ ];
	@words[ $_ ]:delete and $deleted++ if $word ne $word.comb.sort.join;
    }

    $deleted.say;
#}
