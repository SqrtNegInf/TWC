#!/usr/bin/env perl
use v5.36;

use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

say dictOrder($_) for @ARGV;

sub dictOrder($word)
{
    use List::Permutor;

    my $perm = List::Permutor->new( sort { $a cmp $b } split(//, $word) );
    my $place = 0;
    my %seen; # Skip duplicate letters
    while ( my $p = join("", $perm->next()) )
    {
        next if $seen{$p};
        $place++;
        say "$place $p" if $Verbose;
        last if $p eq $word;
        $seen{$p} = true;
    }
    return $place;
}

sub runTest
{
    use Test2::V0  -srand => 1;

    is( dictOrder("CAT"),      3, "Example 1");
    is( dictOrder("GOOGLE"),  88, "Example 2");
    is( dictOrder("SECRET"), 255, "Example 3");

    done_testing;
}
