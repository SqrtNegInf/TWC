#!/usr/bin/env perl
use v5.36;

use experimental qw(for_list);

my  @ARGV = (2, 5, 3, 4);
my @result;
for my($x, $y)(sort {$a<=>$b} @ARGV){
    push @result, sort{$b<=>$a}($x,$y)
}
say "@ARGV -> @result";
