#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

say alnumstr(@ARGV);

sub alnumstr(@str)
{
    use List::Util qw/max/;
    return max map { $_ =~ m/\A\d+\Z/a ? 0+$_ : length($_) } @str;
}

sub runTest
{
    use Test::More;

    is_deeply( alnumstr("perl", "2", "000", "python", "r4ku"), 6, "Example 1");
    is_deeply( alnumstr( "001", "1", "000", "0001"          ), 1, "Example 1");

    is_deeply( alnumstr( "017", "016"), 17, "Octal?");

    is_deeply( alnumstr( "03", "02", "0x1"), 3, "Hex");

    done_testing;
}
