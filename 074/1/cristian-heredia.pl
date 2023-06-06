#!/usr/bin/env perl
use v5.36;

use List::Util qw(reduce);

#Input
my @A = (1, 2, 2, 3, 2, 4, 2);


#Variables
my $floor = @A/2;

my %count;
$count{$_}++ foreach @A;

my $maxValue = List::Util::reduce { $count{$b} > $count{$a} ? $b : $a } keys %count;
 
my $moreFrequest = $count{ $maxValue };

if ($moreFrequest > $floor) {
    print "Output: $maxValue\n";
}
else {
    print "Output: -1\n";
}






