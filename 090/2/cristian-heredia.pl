#!/usr/bin/env perl
use v5.36;

#variables:
my $A = 14;
my $B = 12;
my $result = 0;
print "The result for $A * $B is: ";
calculation();

sub calculation {
    checkOdd($A);
    while ($A != 1) {
        use integer;
        $A = $A/2;
        $B = $B*2;
        checkOdd($A);
    }
    print "$result\n";
}

sub checkOdd {
    my $number = shift;
    if ($number%2) {
        $result = $result + $B;
    }
}
