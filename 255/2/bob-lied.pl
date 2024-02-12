#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Banned = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "banned:s" => \$Banned);
runTest(); exit;

say mfw( join("  ", @ARGV), $Banned);

sub mfw($p, $w)
{
    my %freq;
    $freq{$_}++ for ( split(" ", $p =~ s/[[:punct:]]+/ /gr) );
    delete $freq{$w};
    return (sort { $freq{$b} <=> $freq{$a} } keys %freq)[0];
}

sub runTest
{
    use Test2::V0  -srand => 1;

    my $text;

    $text = <<E_N_D;
Joe hit a ball, the hit ball flew far after it was hit.
E_N_D
    is( mfw($text, "hit"), "ball", "Example 1");

    $text = <<E_N_D;
Perl and Raku belong to the same family.
Perl is the most popular language in the weekly challenge.
E_N_D
    is( mfw($text, "the"), "Perl", "Example 2");

    done_testing;
}
