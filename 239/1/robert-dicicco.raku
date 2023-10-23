#!/usr/bin/env raku

my @myarr1 = (["ab", "c"],["ab", "c"],["ab", "cd", "e"]);
my @myarr2 = (["a", "bc"],["ac", "b"],["abcde"]);

my $cnt = 0;

while $cnt < @myarr1.elems {
    say "Input:  \@arr1 = [@myarr1[$cnt]]";
    say "\t\@arr2 = [@myarr2[$cnt]]";
    @myarr1[$cnt].join eq @myarr2[$cnt].join ?? say "Output: true\n" !! say "Output: false\n";
    $cnt++;
}
