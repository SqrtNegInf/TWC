#!/usr/bin/env raku

sub MAIN(@n = (4,2,3,1,5,0) ) {

    my $pos = @n.first( @n.max, :k);

    say "Input: \@n = ( {@n.join( ', ')})\n"
      ~ "Output: $pos (as element {$pos+1} is the the biggest number)";
}

