#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

sub Usage
{
    return join("\n\t", "Usage: gray N", '2 <= N <= 5');
}

#do { say Usage() } unless scalar(@ARGV) == 1;

my $N = 4;
do { say "Out of range", Usage; } unless 2 <= $N && $N <= 5;

sub graycode
{
    my ($n) = @_;

    my @code = ( 0, 1 );

    while ( $n-- > 1 )
    {
        my $hibit = scalar(@code);    # Power of 2
        @code = ( @code, map { $hibit | $_  } reverse @code );
    }
    return @code;
}

printf("%3d %${N}b\n", $_, $_) for graycode($N);
