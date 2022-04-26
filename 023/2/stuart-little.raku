#!/usr/bin/env raku

my @PRIMES=(2..*).grep(*.is-prime);

sub fct($n,@a) {
    $n.abs == 1 && return @a;
    my $fact=@PRIMES.first($n %% *);
    return fct(($n div $fact), (|@a,$fact));    
}

say 11111.Int.&fct(())
