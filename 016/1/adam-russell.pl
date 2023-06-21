#!/usr/bin/env perl
use v5.36;

use constant PIE_SIZE => 100;
my $pie_remaining = PIE_SIZE;
my @pie_eaters;
my $eater = 1;
my $eaten;
do{
    $eaten = $pie_remaining * ($eater * .01);
    $pie_eaters[$eater] = $eaten;
    $pie_remaining = $pie_remaining - $eaten;
    print "$eater $eaten $pie_remaining\n";
    $eater++;
} while($pie_remaining > 0 && $eaten > 0);
