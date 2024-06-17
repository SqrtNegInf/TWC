#!/usr/bin/env perl

use strict;
use warnings;

my $str = "perl"; my $char = "e";
percentage($str, $char);

$str = "java"; $char = "a";
percentage($str, $char);

$str = "python"; $char = "m";
percentage($str, $char);

$str = "ada"; $char = "a";
percentage($str, $char);

$str = "ballerina"; $char = "l";
percentage($str, $char);

$str = "analitik"; $char = "k";
percentage($str, $char);

exit 0;

sub percentage {
    my $str = shift;
    my $char = shift;

    my %freq;
    $freq{$_}++
        foreach split //, $str;
    printf "str %s char %s -> perc %.0f\n",
        $str, $char,
        $freq{$char}
            ? $freq{$char}/length($str)*100
            : 0;
}
