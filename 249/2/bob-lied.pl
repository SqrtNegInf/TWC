#!/usr/bin/env perl
use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

for my $DI ( @ARGV )
{
    next unless $DI =~ m/\A[ID]+\Z/;
    say "(", join(",", di($DI)->@*), ")";
}

sub di($s)
{
    my @perm;
    my @idx = 0 .. length($s);

    for my $di ( split("", $s) )
    {
        if   ( $di eq "I" ) { push @perm, shift @idx }
        else                { push @perm, pop   @idx }
    }
    push @perm, shift @idx;
    return \@perm;
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is(di("IDID"), [0,4,1,3,2], "Example 1");
    is(di("III"),  [0,1,2,3  ], "Example 2");
    is(di("DDI"),  [3,2,0,1  ], "Example 3");

    done_testing;
}
