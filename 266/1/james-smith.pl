#!/usr/bin/env perl
use v5.36;

sub uncommon_words {
    my %counts;
    for (@_) {
    	$counts{$_}++ for split /\W+/, lc
    }
    my @solo = grep { $counts{$_}==1 } keys %counts;
    @solo ? @solo : '';
}

say join ' ', uncommon_words('Mango is sweet', 'Mango is sour')
