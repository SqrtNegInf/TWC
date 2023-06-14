#!/usr/bin/env perl
use v5.36;
 
my $x;
my $y;
my $mod;
my $oct;
my @array;
 
foreach $x (0..50){
    print "Decimal $x = ";
    if ($x < 8) {
        $oct = $x;
    } else {
        do {
            $y = int($x / 8);
            $mod = $x % 8;
            push (@array, $mod);
            $x = $y;
            } while ($x > 8);
        push (@array, $x);
        $oct = reverse @array;
    }
print "Octal $oct \n";
@array=();
}
