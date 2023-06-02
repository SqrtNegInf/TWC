#!/usr/bin/env perl
use v5.36;

my @N = (10, 8, 12, 15, 5);
my $A = 7;
my $result ;

foreach (my $i=0; $i<@N;$i++) {
    foreach (my $j=0; $j<@N;$j++) {
        if($i != $j) {
            $result = $N[$i] -$N[$j];
            if ($result == $A) {
                print"Output: 1 as $N[$i] - $N[$j]  = $A\n";
                exit;
            }
        }
    }
}
print"Output: 0\n";







