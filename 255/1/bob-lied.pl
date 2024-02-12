#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; 
no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say oddChar(@ARGV[0, 1]);

sub oddChar($s, $t)
{
    my %freq;
    $freq{$_}++ for split(//, $s);
    $freq{$_}-- for split(//, $t);

    my @remain = grep { $freq{$_} != 0 } keys %freq;
    if ( @remain > 1 )
    {
        die "Too many differences $s => $t, [@remain]"
    }
    elsif ( @remain == 0 )
    {
        die "No difference between $s and $t"
    }
    elsif ( $freq{$remain[0]} != -1 )
    {
        die "Not exactly one diff for @remain"
    }
    return $remain[0];
}

sub oddChar2($s, $t)
{
    die qq("$t" has wrong length compared to "$s")
        if length($t) != length($s)+1;

    for my $c ( split(//, $t) )
    {
        if ( ( my $i = index($s, $c) ) < 0 )
        {
            return $c;
        }
        else
        {
            substr($s, $i, 1) = "";
        }
    }
}

sub runTest
{
    use Test2::V0  -srand => 1;

    is( oddChar("Perl",   "Preel"),   "e", "Example 1");
    is( oddChar("Weekly", "Weeakly"), "a", "Example 2");
    is( oddChar("Box",    "Boxy"),    "y", "Example 3");

    like(
        dies { oddChar("xyzzy","xyzzy") }, qr/No difference/,
        "Dies if no difference");
    like(
        dies { oddChar("xyzzy","plover") }, qr/Too many/,
        "Dies if too many differences");
    like(
        dies { oddChar("xyzzy","xyzzyAA") }, qr/exactly one/,
        "Dies if more than one of diff");

    done_testing;
}
