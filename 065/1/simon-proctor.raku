#!/usr/bin/env raku

#just run both ways

sub MAIN (
    UInt $n =  2, #= Number of digits
    UInt $s = 10,  #= Target number
#    Bool :b(:$brute) where *.so #= Use Brute Force Technique
) {
    .say for ( (1 x $n).Int..(9 x $n).Int ).grep( { ([+] $_.comb) ~~ $s } );  
    #.say for ( (1 x $n).Int..(9 x $n).Int ).hyper.grep( { ([+] $_.comb) ~~ $s } );  

#multi sub MAIN (
#    UInt $n = 2, #= Number of digits
#    UInt $s = 10,  #= Target number
#    Bool :b(:$brute) = False #= Use Brute Force Technique 
#) {
    .say for calculate-sums( $n, $s, 1 ).grep( { defined $_ } );
}

multi sub calculate-sums( UInt $n, UInt $s where { $n * 9 < $s }, $ ) {}

multi sub calculate-sums( UInt $n, 0, $ ) { 0 x $n }

multi sub calculate-sums( UInt $n, UInt $s, $start = 0 ) {
    my $end = $s > 9 ?? 9 !! $s;

    gather {
        for $start..$end -> $val {
            for calculate-sums( $n-1, $s-$val, 0 ) -> $sum {
                next unless defined $sum;
                take "{$val}{$sum}";
            }
        }
    }
}
