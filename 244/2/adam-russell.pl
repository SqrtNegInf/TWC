#!/usr/bin/env perl
use v5.36;

sub group_hero{
    my @group = @_;
    my $group_hero = 0;
    do{
        my $indices = $_;
        my @hero = sort {$a <=> $b} @group[grep{vec($indices, $_, 1) == 1} 0 .. @group - 1];
        $group_hero += ($hero[@hero - 1]**2 * $hero[0]);
    } for 1 .. 2**@group - 1;
    return $group_hero;
}

MAIN:{
    say group_hero qw/2 1 4/;
}
