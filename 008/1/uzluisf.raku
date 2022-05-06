#!/usr/bin/env raku

sub pos-proper-divisors( Int $n --> Seq ) {
    return do gather for 1..^$n.abs {
        take $_ if $n %% $_
    }
}

proto is-perfect( Int:D $n --> Bool ) { * }
multi is-perfect( 0 )  { False }
multi is-perfect( 1 )  { False }
multi is-perfect( $n ) {
    return $n.abs == pos-proper-divisors($n).sum
}

#| Print N comma-separated perfect numbers.
sub MAIN(
    Int:D $num = 3 #= Number of perfect numbers. Defaults: 5
) {
    my @first-perfect;
    loop (my $i = 1;  ;$i++) {
       @first-perfect.push: $i if is-perfect($i);
       last if @first-perfect == $num;
    }
    @first-perfect.join(', ').put;
}
