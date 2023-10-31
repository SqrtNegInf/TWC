#!/usr/bin/env perl
use v5.36;


use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

my $Check = "";

GetOptions("check:s" => \$Check, "test" => \$DoTest, "verbose" => \$Verbose);
runTest();exit;

die "Usage: $0 -c check stringlist..." unless $Check and @ARGV > 0;

say acronym($Check, @ARGV) ? "true" : "false";

sub acronym($chk, @str)
{
    return $chk eq join("", map { lc substr($_, 0, 1) } @str)
}

sub runTest
{
    use Test::More;
    use builtin qw/false true/; no warnings "experimental::builtin";

    is( acronym( "ppp", qw(Perl Python Pascal)), true,  "Example 1");
    is( acronym( "rp" , qw(Perl Raku         )), false, "Example 2");
    is( acronym( "oac", qw(Oracle Awk C      )), true,  "Example 3");

    done_testing;
}
