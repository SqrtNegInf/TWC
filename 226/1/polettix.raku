#!/usr/bin/env raku

# out of order

#sub MAIN ($s, *@i) { 
my $s = 'lacelengh';
my @i = [3,2,0,5,4,8,6,7,1];
put $s.comb[@i].join('') 
#}
