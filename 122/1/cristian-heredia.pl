#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

# Initial variable
my @N = (10, 20, 30, 40, 50, 60, 70, 80, 90);

# Other variables
my $counter = 1;
my $sentence = '';
my $sum = 0;

foreach (my $i = 0; $i <@N; $i++){   
    $sum += $N[$i];
    if ($i == 0) {
        $sentence = $sum/$counter;
    }
    else {
        $sentence = $sentence.", ".$sum/$counter;
    }
    $counter++;
}
print("Output: $sentence");
