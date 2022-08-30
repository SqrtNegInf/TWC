#!/usr/bin/env raku

#sub MAIN( *@n where { @n.grep( * ~~ Int ).elems == @n.elems } ) {
    my @n = (15,2500,35,400,55,65,75); 
    my @symbols = '▁' ... '█';
    my ($min, $max) = @n.min, @n.max;
    my @graph = @n.map: { ( $_ - $min ) / ( $max - $min ) * @n.elems };
    @symbols[ @graph ].join.say;
#}
