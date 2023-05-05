#!/usr/bin/env perl
use v5.36;
use boolean;

sub is_permuted{
    my($x, $y) = @_;
    my(@x, @y); 
    map {$x[$_]++} split(//, $x);
    map {$y[$_]++} split(//, $y);
    return false if $#x != $#y;
    my @matched = grep {(!$x[$_] && !$y[$_]) || ($x[$_] && $y[$_] && $x[$_] == $y[$_])} 0 .. @y - 1;
    return true if @matched == @x;
    return false;
}

sub smallest_permuted{
    my $x = 0;
    {
        $x++;
        redo unless is_permuted($x, 2 * $x)     && is_permuted(2 * $x, 3 * $x) && 
                    is_permuted(3 * $x, 4 * $x) && is_permuted(4 * $x, 5 * $x) && 
                    is_permuted(5 * $x, 6 * $x);
    }
    return $x;
}

MAIN:{
    print smallest_permuted . "\n";
}
