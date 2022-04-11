#!/usr/bin/env raku

#multi sub MAIN (
#    UInt :n(:$number) = 10, #= Number of values to generate
#    UInt :m(:$max) where { $max > $number } = 50  #= Maximum value (must be greater then $n)
#) {
#    my @list = (1..$max).pick($number);
#    say "Generated List : {@list.join(",")}";
#    MAIN( @list );
#}

#| Given a list of Integers print the noble integers in the list
multi sub MAIN (
    @values is copy = (19,11,9,7,20,3,17,16,2,14,1)
) {
    @values.=sort;
    while ( @values ) {
        my $val = @values.shift;
        say $val if $val == @values.elems;
    }
}
