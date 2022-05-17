#!/usr/bin/env raku

say palindromic-primes( 1 ... 1000  );
say palindromic-primes( 1 .. 1000);
say palindromic-primes( ( 1 ... 1000 ).List );
say palindromic-primes( ( 1 ... 1000 ).Array );
say palindromic-primes( 2  );

sub palindromic-primes( Any $x --> Seq ) {
    grep { .flip ~~ $_ }, grep { .is-prime }, $x.Seq ;
}
