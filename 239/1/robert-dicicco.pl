#!/usr/bin/env perl
use v5.36;

my @myarr1 = (["ab", "c"],["ab", "c"],["ab", "cd", "e"]);
my @myarr2 = (["a", "bc"],["ac", "b"],["abcde"]);
my ($arr1, $arr2,$arr1_val,$arr2_val);

my $cnt = 0;
while ( $cnt < scalar @myarr1) {
    say "Input:  \@arr1 = [@{$myarr1[$cnt]}]";
    say "\t\@arr2 = [@{$myarr2[$cnt]}]";
    join("",@{$myarr1[$cnt]}) eq join("",@{$myarr2[$cnt]}) ? say "Output: true\n" : say "Output: false\n" ;
    $cnt++;
}
