#!/usr/bin/env perl
use v5.36;

sub divisible_pairs{
    my($numbers, $k) = @_;
    my @pairs;
    for my $i (0 .. @{$numbers} - 1){
        for my $j ($i + 1 .. @{$numbers} - 1){
            push @pairs, [$i, $j] if(($numbers->[$i] + $numbers->[$j]) % $k == 0);
        }
    }
    return @pairs;
}

MAIN:{
    my @pairs;
    @pairs = divisible_pairs([4, 5, 1, 6], 2);
    print @pairs . "\n";
    @pairs = divisible_pairs([1, 2, 3, 4], 2);
    print @pairs . "\n";
    @pairs = divisible_pairs([1, 3, 4, 5], 3);
    print @pairs . "\n";
    @pairs = divisible_pairs([5, 1, 2, 3], 4);
    print @pairs . "\n";
    @pairs = divisible_pairs([7, 2, 4, 5], 4);
    print @pairs . "\n";
}
