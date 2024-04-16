#!/usr/bin/env perl

use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub gle($str)
{
    use List::Util qw/first/;

    # Put all lower case letters before upper, in reverse order
    my @rts = sort { $b cmp $a } split(//, $str);

    # Return the first lower case character that also has an upper
    while ( defined(my $char = shift @rts) )
    {
        return uc($char) if $char eq lc($char) && first { $_ eq uc($char) } @rts;
    }
    return '';
}

sub runTest
{
    use Test2::V0 -srand => 1;

    is( gle("PeRlwEeKLy"), 'L', "Example 1");
    is( gle("ChaLlenge" ), 'L', "Example 2");
    is( gle("The"       ),  '', "Example 3");

    done_testing;
}
