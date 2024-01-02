#!/usr/bin/env raku

#sub MAIN( $string  ) {
my $string = "IDID";

    my @chars = $string.comb;
    for ( 0 .. @chars.elems ).permutations -> $perm {
	my $ok = True;
	for 0 ..^ $perm.elems - 1 -> $i {
	    $ok = False and next if @chars[ $i ] ~~ 'D' && $perm[ $i ] < $perm[ $i + 1 ];
	    $ok = False and next if @chars[ $i ] ~~ 'I' && $perm[ $i ] > $perm[ $i + 1 ];
	    last if !$ok;
	}

	$perm.join(", ").say and last if $ok;
    }
#}
