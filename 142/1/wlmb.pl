#!/usr/bin/env perl
use v5.36;

my ($m,$n)= (24, 2); # @ARGV;
my $q=sqrt($m);
my @divisors_ending_in_n=grep {$_=~/$n$/}
    my @divisors=sort {$a<=>$b} map {1<$_<$q?($_, $m/$_):$_} grep {$m%$_==0}(1..$q);
say "Input: m=$m n=$n,\nOutput: ", scalar(@divisors_ending_in_n),
    "\nas the divisors of $m are: ", join(" ", @divisors),
    "\nand those ending in $n are: ", join(" ", @divisors_ending_in_n), "\n";
