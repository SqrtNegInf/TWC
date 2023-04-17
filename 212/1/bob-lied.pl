#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

sub jumpLetter($c, $n)
{
    my $v = ord($c);
    my $lc_a = ord('a');
    my $uc_A = ord('A');
    if ( $lc_a <= $v <= ord('z') )
    {
        return chr($lc_a+(($v - $lc_a) + $n) % 26);
    }
    elsif ( $uc_A <= $v <= ord('Z') )
    {
        return chr($uc_A+(($v - $uc_A) + $n) % 26);
    }
    else
    {
        return $c;
    }
}

sub jumpWord($word, $jumps)
{
    # return join "", map { jumpLetter(substr($word, $_, 1), $jumps->[$_]) } 0 .. $jumps->$#*;
    substr($word, $_, 1, jumpLetter(substr($word, $_, 1), $jumps->[$_]) ) for 0 .. $jumps->$#*;
    return $word;
}

sub runTest
{
    use Test::More;

    is( jumpWord("Perl", [2,22,19,9]), "Raku", "Example 1");
    is( jumpWord("Raku", [24,4,7,17]), "Perl", "Example 2");

    done_testing;
}

