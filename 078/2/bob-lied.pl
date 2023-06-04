#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

sub Usage { qq(Usage: $0 "(a b c d e)" "(x y)" ) };

my $Verbose = 0;
GetOptions('verbose' => \$Verbose);

my @A = (10,20,30,40,50); my @B = (3,4);

my $lastA = $#A;

for my $pivot ( @B )
{
    my @rot = ( @A[ $pivot .. $lastA], @A[0..$pivot-1] );
    say "[ @rot ]";
}
