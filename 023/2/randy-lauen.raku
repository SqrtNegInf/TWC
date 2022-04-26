#!/usr/bin/env raku

sub my-prime-factors( Int $n is copy ) {
    my @factors;
    while $n %% 2 {
        @factors.push: 2;
        $n = ($n / 2).Int;
    }
    for 3, 5 ... sqrt($n) -> $i {
        while $n %% $i {
            @factors.push: $i;
            $n = ($n / $i).Int;
        }
    }
    @factors.push: $n if $n > 2;

    return @factors;
}


#`{{
multi MAIN( Int $input where * > 0 ) {
    my @factors = my-prime-factors( $input );
    say @factors.elems
        ?? @factors.join(', ')
        !! "No prime factors for: $input";
    ;
}
}}


#multi MAIN( Bool :$test! ) {
    use Test;
    use Prime::Factor;

    plan 1;

    my $max = 1000;
    my %mine     = $_ => my-prime-factors($_).List for 1..$max;
    my %expected = $_ => prime-factors($_).List    for 1..$max;
    #my %mine     = hyper for 1 .. $max { $_ => my-prime-factors($_).List };
    #my %expected = hyper for 1 .. $max { $_ => prime-factors($_).List };

    is-deeply( %mine, %expected, "all prime factors up to $max match" );
#}


