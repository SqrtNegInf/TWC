#!/usr/bin/env raku

# output differs  from others

sub MAIN( $a= 1, $b = 2, @c = <3 10> ) {
    my $bitsum = 0;
    my @a = ( $a, $b, @c).flat;
    loop (my $i = 0; $i < @a.elems; $i++) {
        $bitsum += sum( @a.shift X+& @a );
    }
    say $bitsum;
}

