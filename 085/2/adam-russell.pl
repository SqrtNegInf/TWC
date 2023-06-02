#!/usr/bin/env perl
use v5.36;

use boolean;

sub log_a {
    my($a, $n) = @_;
    return log($n)/log($a);
}

MAIN:{
    my $N = 125;
    my $found = false;                  
    for my $a (2 .. $N){ 
        my $b = log_a($a, $N);
        if($b =~ /^[-]?\d+$/ && $b > 1){ 
            print "1\n";
            $found = true;
            last;
        }
    }
    print "0\n" if(!$found);
}
