#!/usr/bin/env perl

use v5.36;
no warnings;

my @A = (2,3,5,7);

my $out=0;
my ($u, $d, $t);
for(sort {$a <=> $b} grep {$_%2} @A){
    ($u,$d,$t)=($d,$t,$_); # Current three elements
    $out=1, last if $u+4==$d+2==$t
}
say(join " ", @A, "-> $out");
