#!/usr/bin/env perl
use v5.36;
#use strict;
#use warnings;

use experimental qw/ signatures /;
no warnings "experimental::signatures";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

my $NumRows = 10;
die "Usage: $0 N, where N >= 1" unless $NumRows > 0;

sub pascalTriangle($n)
{
    say "1";
    my $prevRow = [ 1, 1 ];
    say "@$prevRow" if $n >= 2;

    while ( --$n > 1 )
    {
        my $nextRow = [ 1 ];
        for ( my $c = 0 ; $c < scalar(@$prevRow)-1; $c++ )
        {
            push @$nextRow, $prevRow->[$c] + $prevRow->[$c+1];
        }
        push @$nextRow, 1;
        say "@$nextRow";
        $prevRow = $nextRow;
    }

}

pascalTriangle($NumRows);
