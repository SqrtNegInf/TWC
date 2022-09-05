#!/usr/bin/env raku

my @numbers = (1,9,0,6,2,3,8,5,104,);
my $line = 5;
my $number = +$line ;
say @numbers.grep( { $_ > $number} ) ;
