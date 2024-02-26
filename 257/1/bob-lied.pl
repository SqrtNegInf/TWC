#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

say "(", join(", ", stc(@ARGV)->@*), ")";

sub stc(@ints)
{
    # Sort in descending order
    my @sorted = sort { $b <=> $a } @ints;

    my %smaller = map { $_ => 0 } @ints;
    while ( defined(my $one = shift @sorted) )
    {
        # Skip over duplicate values;
        while ( @sorted && $sorted[0] == $one ) { shift @sorted }
        $smaller{$one} = scalar(@sorted);
    }
    return [ @smaller{ @ints } ];
}

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()) if $DoTest;

sub runTest
{
    use Test::More;

    is( stc(5,2,1,6), [2,1,0,3], "Example 1");
    is( stc(1,2,0,3), [1,2,0,3], "Example 2");
    is( stc(0,1    ), [0,1    ], "Example 3");
    is( stc(9,4,9,2), [2,1,2,0], "Example 4");
    is( stc(9,9,9,9), [0,0,0,0], "All same");

    done_testing;
}
