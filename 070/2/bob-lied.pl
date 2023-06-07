#!/usr/bin/env perl
use v5.36;

my $N = 4;

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
