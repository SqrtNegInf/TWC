#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

my @S1 = (1, 2, 5, 3, 4);
my @S2 = (4, 6, 7, 8, 9);

foreach(my $i=0;$i<@S1;$i++){
    my $value = $S1[$i];
    if ( grep( /^$value$/, @S2 ) ) {
        print"Output: 0\n";  
        exit;
    }
}
print"Output: 1\n";    
