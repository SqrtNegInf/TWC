#!/usr/bin/env perl
use v5.36;

use POSIX qw(floor);
use Text::Wrap qw(wrap $columns $break);

for(5..7){
    my @farey=([0,1],[1,$_]);
    while($farey[-1][1]!=1){
        my ($a,$b,$c,$d)=(@{$farey[-2]}, @{$farey[-1]});
        my $k=floor(($_+$b)/$d);
	push @farey, [$k*$c-$a, $k*$d-$b];
    }
    $columns=62; $break=qr/\s/;
    say "Input: $_\n",wrap("", "        ", "Output: ",
	join ", ",
	map {"$_->[0]/$_->[1]"} @farey);
}
