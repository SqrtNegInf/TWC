#!/usr/bin/env raku

#sub MAIN( Str :$a, Str :$b where { $b.chars == $a.chars + 1 } ) {
my $a = "Perl"; my $b = "Preel";
    my $classification = BagHash.new: $b.comb;
    for $a.comb {
	$classification{ $_ }--;
	$classification{ $_ }:delete if ( $classification{ $_ } <= 0 );
    }

    $classification.keys.head.say;
#}
