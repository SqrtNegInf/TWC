#!/usr/bin/env perl
use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say ( isl2(@ARGV) ? "true" : "false" );

sub fq($a0, $a1, $a2, $a3)
{
    my $denom = $a1*$a1 - $a0*$a2;
    say "fq: denom=$denom" if $Verbose;
    return undef if $denom == 0;
    my $q = ($a1*$a2 - $a0*$a3)/$denom;
    say "fq: q=$q" if $Verbose;
    return $q;
}

sub fp($q, $a0, $a1, $a2)
{
    return undef if $a0 == 0;
    my $p = ($a2 - $a1 * $q) / $a0;
    say "fp: p=$p" if $Verbose;
    return $p;
}

sub isl2(@a)
{
    my $q = fq( @a[0..3] );
    return false unless defined $q && int($q) == $q;

    my $p = fp($q, @a[0..2]);
    return false unless defined $p && int($p) == $p;

    # Must also be true for remaing values of @a
    for my $i ( 4 .. $#a )
    {
        my $nexta = $p * $a[$i-2] + $q * $a[$i-1];
        if ( $a[$i] != $nexta )
        {
            say "fails for i=$i, expect $a[$i], got $nexta" if $Verbose;
            return false;
        }
    }
    return true;
}

sub runTest
{
    use Test::More;
    no warnings "experimental::builtin";

    is_deeply( isl2(1, 1, 2,  3, 5), true,  "Example 1");
    is_deeply( isl2(4, 2, 4,  5, 7), false, "Example 2");
    is_deeply( isl2(4, 1, 2, -3, 8), true,  "Example 3");

    done_testing;
}
