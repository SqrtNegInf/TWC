#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say revVow($_) for @ARGV;

sub revVow($s)
{
    state $isVowel = qr/[aeiou]/i;

    my @v = $s =~ m/$isVowel/g;
    my $rev;
    for ( split(//, $s) )
    {
        my $next = ( /$isVowel/ ? pop @v : $_ );
        $rev .= ( /\p{Uppercase}/ ? uc $next : lc $next );
    }
    return $rev;
}

sub runTest
{
    use Test::More;

    is( revVow("Raku"),  "Ruka",  "Example 1");
    is( revVow("Perl"),  "Perl",  "Example 2");
    is( revVow("Julia"), "Jaliu", "Example 3");
    is( revVow("Uiua"),  "Auiu",  "Example 4");
    is( revVow("AEIOU"), "UOIEA", "Odd length");
    is( revVow("aEiOu"), "uOiEa", "Retain casing 1");
    is( revVow("AeIo"),  "OiEa", "Retain casing 2");

    done_testing;
}
