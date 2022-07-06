#!/usr/bin/env raku

sub proper-divisors (Int $n where $n > 0 --> Array ) {
    # after the Rosetta code
    my @result = 1 if $n > 1;
    ( 2 .. $n.sqrt.Int ).map: -> $d {
        unless $n % $d {
            @result.push: $d;
            my $y = $n div $d;
            @result.push: $y if $y != $d
        }
    }
    @result;
}

constant @odd-abundant = gather {
    my Int $i = 943;
    loop {
        $i += 2;
        next if $i.is-prime;
        if $i < [+] proper-divisors( $i) {
            take $i;
            next;
        }
    }
}

say @odd-abundant[ 0 .. 19].join( ', ');
