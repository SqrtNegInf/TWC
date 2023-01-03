#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 1;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()) if $DoTest;

sub wiggleSort(@list)
{
    my @sl = sort { $a <=> $b } @list;

    # Subtract one for 0-based arrays
    my $midpoint = int( scalar(@sl) / 2 ) - 1;
    my @bottom = reverse @sl[0..$midpoint];
    my @top    = reverse splice(@sl, $midpoint+1);

    my @result;
    while ( @bottom && @top )
    {
        push @result, (shift @bottom), (shift @top);
    }
    push @result, @top if @top;  # Odd-sized lists
    return \@result;
}

sub runTest
{
    use Test::More;

    is_deeply( wiggleSort(1,5,1,1,6,4), [1,6,1,5,1,4], "Example 1");
    is_deeply( wiggleSort(1,3,2,2,3,1), [2,3,1,3,1,2], "Example 2");
    is_deeply( wiggleSort(1,3,2,2,3,1,4), [2,4,1,3,1,3,2], "Odd");

    done_testing;
}
