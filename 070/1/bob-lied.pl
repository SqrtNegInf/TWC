#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub Usage
{
    return join("\n\t",
             "Usage: swap STRING COUNT OFFSET"
            ,"1 <= COUNT <= OFFSET"
            ,"(COUNT+OFFSET) <= length(STRING)"
            ,"Example: swap perlandraku 3 4"
        );
}

#do { say Usage; exit 1 } unless scalar(@ARGV) == 3;

my ($string, $count, $offset) = ('perlandraku', 3, 4);

my $len = length($string);

do { say "OFFSET out of range", Usage; exit 2 } unless $offset < $len;
do { say "COUNT out of range", Usage; exit 2 } unless 1 <= $count && $count <= $offset;

# Brute force according to specification
sub swap
{
    my ($str, $cnt, $off) = @_;
    my $len = length($str);

    for my $p ( 1..$cnt )
    {
        my $j = ($p % $len);
        my $k = (($p + $off) % $len);

        my $t = substr($str, $j, 1);
        substr($str, $j, 1) = substr($str, $k, 1);
        substr($str, $k, 1) = $t;
    }
    return $str;
}

# Swapping the entire substring at once
sub swap2
{
    my ($str, $cnt, $off) = @_;
    my $len = length($str);

    my $to   = substr($str, 1, $cnt);
    my $from = substr($str, $off+1, $cnt);

    return substr($str, 0, 1) . $from
         . substr($str, $cnt+1, $off - $cnt)
         . $to
         . substr($str, $off+$cnt+1)
         ;
}

# Convert to array and use array operations
sub swap3
{
    my ($str, $cnt, $off) = @_;
    my $len = length($str);

    my @str = split(//, $str);
    my @from = @str[ 1 .. $cnt+1 ];

    @str[1 .. $cnt+1] = @str[$off+1 .. $off+$cnt+1];
    @str[$off+1 .. $off+$cnt+1] = @from;

    # Would splice be any better?

    return join("", @str);
}

say swap('perlandraku', 3, 4);
say swap2('perlandraku', 3, 4);
say swap3('perlandraku', 3, 4);
