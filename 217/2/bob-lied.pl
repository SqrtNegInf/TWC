#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
exit(!runTest()) if $DoTest;

sub maxNumber(@list)
{
    my @sorted = sort { "$b$a" cmp "$a$b" } @list;
    say "sorted: [@sorted]" if $Verbose;
    return 0 + join "", @sorted;
}

sub runTest
{
    use Test2::V0;

    is( maxNumber(1, 23         ),    231, 'Example 1');
    is( maxNumber(10, 3, 2      ),   3210, 'Example 2');
    is( maxNumber(31, 2, 4, 10  ), 431210, 'Example 3');
    is( maxNumber(5, 11, 4, 1, 2), 542111, 'Example 4');
    is( maxNumber(1, 10         ),    110, 'Example 5');
    is( maxNumber(1, 10, 100    ), 110100, 'Example 6');
    is( maxNumber(7,  0, 0      ),    700, 'With a 0');
    is( maxNumber(0,  0, 0      ),      0, 'All zero');

    done_testing;
}
