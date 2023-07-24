#!/usr/bin/env perl

use strict;
use warnings;

my @strings = ('lacelengh', 'rulepark');
my @indices = ([3,2,0,5,4,8,6,7,1],[4,7,3,1,0,5,2,6]);

my $offset = 0;

my %letters = ();
my $letter;

for my $str ( @strings) {
    my $ndx = $indices[$offset];
    print("Input: \$string = $str, \@indices = (@$ndx)\n");
    my $cnt = 0;
    while ($cnt < length($str)) {
        $letter = substr($str,$cnt,1);
        $letters{$ndx->[$cnt++]} = $letter;
    }
    $cnt = 0;
    print("Output: ");
    while ($cnt < length($str)) {
        print($letters{$cnt++});
    }
    print("\n\n");
    $offset == scalar @indices ? exit : $offset++;
}
