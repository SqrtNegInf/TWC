#!/usr/bin/env raku

my $n = 228;     # number  to  factor

# for 2, 3, 5, 7, ..., if the  number  is prime  enter  the  loop
for (2, 3, *+2 ... *).grep({.is-prime}) ->$p   {

    while $n %% $p   {     # $n  evenly  divisible  by the  current  prime?
        say $p;             #      print  the  prime
        $n div= $p;         #      divide$n by the  prime
    }

    # Is $p > $n.sqrt?
    # But , I suspect$p ** 2 >$n , is  faster  to  compute.
    if ($p ** 2 > $n)   {
        $n.say;
        last;
    }
}
