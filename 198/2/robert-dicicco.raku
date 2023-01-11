#!/usr/bin/env raku

 

my @arr = [10,15,1,25];

 

for (@arr) -> $n {

                my $cnt = 0;

                print "Input: \$n = $n\n"; # find primes less than @arr[$n]

                for (0 .. $n - 1) -> $x {

                                if $x.is-prime {

                                                $cnt++;

                                }

                }

                print "Output: $cnt\n\n";

}
