#!/usr/bin/env perl
use v5.36;
use POSIX;

sub disarium_n{
    my($n) = @_;
    my @disariums;
    map{
        return @disariums if @disariums == $n;
        my @digits = split(//, $_);
        my $digit_sum = 0;
        map{
            $digit_sum += $digits[$_] ** ($_ + 1);
        } 0 .. @digits - 1;
        push @disariums, $digit_sum if $digit_sum == $_;
    } 0 .. INT_MAX / 100;
}

MAIN:{
    print join(", ", disarium_n(18)) . "\n";
}
