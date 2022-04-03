#!/usr/bin/env perl
use strict;
use warnings;


#variables
my $N;
my $result = 1;
my $count = 0;
my $sentence;


requestNumber();

sub requestNumber {
   
    print "Please, introduce a number <= 10\n";
    $N = 10;
    $N =~ s/\s//g;
    if ($N =~ /^\d+$/ and $N <= 10) {
        obtainFactorial();
    }
    else {
        print "That's not a valid number\n";
        requestNumber();
    }
   
}

sub obtainFactorial {
   
    foreach (my $i = 2; $i <= $N; $i++){
       
        $result = $result * $i;
    }
    $sentence = "$N! = $result";
    trailingZeros();
}


sub trailingZeros {
   
    if ($result =~ /0$/) {
       
        chop($result);
        $count++;
        trailingZeros();
    }
    else {
        #Output
        print "$count as ".$sentence." has $count trailing zero\n";
    }
   
}
