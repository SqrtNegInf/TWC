#!/usr/bin/env raku


my $target =0; 
my @list = -25, -10, -7, -3, 2, 4, 8, 10;
@list.combinations(3).grep( *.sum == $target ).say;
