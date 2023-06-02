#!/usr/bin/env perl
use v5.36;

my @R = (0.5, 1.1, 0.3, 0.7);
my $result = 0;

foreach (my $i = 0; $i<@R; $i++) {
        if ($R[$i] < 2 ) {
            foreach (my $j = 0; $j<@R; $j++)  {
                if ($i != $j and ($R[$i] + $R[$i] < 2) ) {
                    foreach (my $k = 0; $k<@R; $k++) {
                        if ($i != $k and $j != $k and ($R[$i] + $R[$j] +  $R[$k] < 2) and $result  == 0 ) {
                            $result  = 1;
                            print "Output: 1 as 1 < $R[$i]+ $R[$j] + $R[$k] < 2\n";
                        }
                    }
                }
            }
        }
}
if ($result  == 0) {
    print "Output: 0\n";
}
