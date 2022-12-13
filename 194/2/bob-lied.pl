#!/usr/bin/env perl

use v5.36;

use List::Util qw/all/;
use List::MoreUtils qw/frequency/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest() and exit; # if $DoTest;

say canEqualize($_) for @ARGV;

sub canEqualize($str)
{
    my $strlen = length($str);

    if    ( $strlen == 0 ) { return 0; }
    elsif ( $strlen == 1 ) { return 1; }
    elsif ( $strlen == 2 ) { return 1; }

    my %freq = List::MoreUtils::frequency( split(//, $str) );
    my @byFrequency = sort { $freq{$b} <=> $freq{$a} } keys %freq;

    # If there's only one letter
    return 1 if @byFrequency == 1;

    # Can only be equalized if the most frequent letter occurs
    # once more than the rest, and all the rest are the same

    #my $isPlusOne = ( $freq{$byFrequency[0]} == $freq{$byFrequency[1]} + 1 );
    #my @slice = @byFrequency[2 .. $#byFrequency];
    #my $isSame = List::Util::all { $freq{$_} == $freq{$byFrequency[1]} } @slice;
    #return $isPlusOne && $isSame;
    
    my $can = ( $freq{$byFrequency[0]} == $freq{$byFrequency[1]} + 1 )
           && List::Util::all { $freq{$_} == $freq{$byFrequency[1]} }
                               @byFrequency[2 .. $#byFrequency];
    return $can ? 1 : 0; # We want the numeric value, not undef or ''
}

sub runTest
{
    use Test2::V0;

    is( canEqualize(""),        0, "EMPTY");
    is( canEqualize("a"),       1, "a");
    is( canEqualize("ab"),      1, "ab");
    is( canEqualize("bb"),      1, "bb");
    is( canEqualize("abbc"),    1, "abbc");
    is( canEqualize("ffff"),    1, "ffff");
    is( canEqualize("xyzyyxz"), 1, "xyzyyxz");
    is( canEqualize("xzxz"),    0, "xzxz");
    is( canEqualize("axxxz"),   0, "axxxz");

    done_testing();
}

