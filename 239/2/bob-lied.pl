#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

my $Allowed = "";

GetOptions("allowed:s" => \$Allowed, "test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say consistentStrings($Allowed, @ARGV);

sub consistentStrings($allowed, @str)
{
    use re 'eval';
    return 0 if $allowed eq "";
    my $rx = qr/^[$allowed]+$/;

    return scalar grep /$rx/, @str;
}

sub runTest
{
    use Test2::V0;

    is( consistentStrings("ab",  qw(ad bd aaab baa badab")   ), 2, "Example 1");
    is( consistentStrings("abc", qw(a b c ab ac bc abc)      ), 7, "Example 2");
    is( consistentStrings("cad", qw(cc acd b ba bac bad ac d)), 4, "Example 3");

    is( consistentStrings("", qw(a b c)), 0, "Nothing allowed");

    done_testing;
}

