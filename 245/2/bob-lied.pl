#!/usr/bin/env perl

use v5.36;
use builtin qw/true false/; no warnings "experimental::builtin";

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest();
exit;

{
use List::Util qw/all/;
die "Numbers must be >= 0" unless all { $_ >= 0 } @ARGV;
}

say big3(@ARGV);

sub is3($n) { join("", @$n) % 3 == 0 }

sub _big3($ints, $indent)
{
    say "${indent}Enter (@$ints)" if $Verbose;
    return -1 unless @$ints;
    if ( is3($ints) )
    {
        say "${indent}Found @$ints" if $Verbose;
        return 0 + join("", @$ints);
    }

    # Single digits fail at this point
    return -1 if @$ints == 1;

    # Try removing the smallest numbers first.
    # ints is known to be sorted descending.
    for ( my $exclude = $ints->$#* ; $exclude >= 0 ; $exclude-- )
    {
        # Never remove a zero; they will make the number 10 times bigger
        next if $ints->[$exclude] == 0;

        my @smaller = ( $ints->@[0 .. $exclude-1], $ints->@[$exclude+1 .. $ints->$#*] );
        if ( is3( \@smaller ) )
        {
            say "${indent}Found @smaller" if $Verbose;
            return 0 + join("", @smaller);
        }
        else
        {
            my $answer = _big3(\@smaller, "  $indent");
            say "${indent}returning $answer" if $Verbose;
            return $answer if $answer >= 0;
        }
    }
    say "${indent}fail, return -1" if $Verbose;
    return -1;
}

sub big3(@ints)
{
    # Put biggest values first
    @ints = sort { $b <=> $a } @ints;

    return _big3(\@ints, "");
}

sub runTest
{
    use Test2::V0 -srand => 1;
    use builtin qw/true false/; no warnings "experimental::builtin";

    is( is3([    0]), true,  "is3 0");
    is( is3([    8]), false, "is3 8");
    is( is3([    9]), true,  "is3 9");
    is( is3([  4,7]), false, "is3 47");
    is( is3([  4,8]), true,  "is3 48");
    is( is3([1,4,3]), false, "is3 143");
    is( is3([1,4,4]), true,  "is3 144");
    is( is3([14,34]), true,  "is3 1434");

    is( big3(8,1,9    ),  981, "Example 1");
    is( big3(8,6,7,1,0), 8760, "Example 2");
    is( big3(1        ),   -1, "Example 3");

    done_testing;
}
