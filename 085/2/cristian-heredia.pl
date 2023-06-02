#!/usr/bin/env perl
use v5.36;

my $N = 125;
my $result;
my $final = 0;

calculateResult();

sub calculateResult {
    
    foreach(my $a = 1; $a < $N; $a++) {
        foreach(my $b = 2; $b < $N; $b++) {
            if ($final == 0) {
                $result  = $a ** $b;
                    if ($result == $N) {
                        $final = 1;
                        print "Output: 1 as $N = $a ** $b\n";       
                    }
            }
        }
    }
    if  ($final == 0) {
        print "Output: 0\n";
    }
}
