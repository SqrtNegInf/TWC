#!/usr/bin/env perl

use strict;
use warnings;

srand 1;

my $randomNumber = int(rand(50));
my @randomArray;

for (my $i = 0; $i <= 6; $i++){
    my $randomNumber = int(rand(50));
    if (!exists($randomArray[$randomNumber])){
        push (@randomArray,$randomNumber);
    }
    print "@randomArray\n";
}
