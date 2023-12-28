#!/usr/bin/env perl
use v5.36;

use builtin qw/true false ceil floor/; no warnings "experimental::builtin";

use List::Util qw/min/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest(); exit;

#say "(", join(",", shortest(@ARGV)->@*), ")";

sub shortest($str, $char)
{
    my @dist;
    my @s = split //, $str; # str as vector of characters

    # List of indexes where char appears
    my @cloc = grep { $s[$_] eq $char } 0 .. $#s;

    # Potentially a lot of useless array operations, math
    # and comparisons if char appears a lot.
    for my $i ( 0 .. $#s )  # For each letter in str
    {
        #               List of location differences
        #               vvvvvvvvvvvvvvvvvvvvvvvvvvvv
        push @dist, min map { abs($_ - $i) } @cloc;
    }
    return \@dist;
}

# Only two location differences really matter: the next one
# ahead or the last one behind.  Alternate implementation
# looks only for those two.  Potentially a lot of string
# scanning if there are very few occurences of char in a
# long string.
sub sd2($str, $char)
{
    my @dist;
    for my $i ( 0 .. length($str)-1 )
    {
        my $ahead  =  index($str, "$char", $i);
        my $behind = rindex($str, "$char", $i);

        if ( $ahead < 0 && $behind < 0 )
        {
            push @dist, undef;
        }
        else
        {
            $behind = $ahead  if $behind == -1;
            $ahead  = $behind if $ahead  == -1;
            push @dist, min abs($i - $behind), abs($ahead - $i);
        }
    }
    return \@dist;
}

# We don't really need to calculate the differences for each
# letter.  The distance counts down until we see the first occurence,
# then up until half way to the next occurrence, then down again.
# Given the locations of the character, we can generate the sequences.
sub sd3($str, $char)
{
    return [ (undef) x length($str) ] if index($str, $char) < 0;
    my @s = split //, $str; # str as vector of characters

    # List of indexes where char appears
    my @cloc = grep { $s[$_] eq $char } 0 .. $#s;

    my @dist;
    my $loc = shift @cloc;
    push @dist, reverse 0 .. $loc;
    while ( defined(my $next = shift @cloc) )
    {
        my $diff = $next - $loc -1;
        push @dist, (1 .. ceil($diff/2)), reverse( 0 .. floor($diff/2));
        $loc = $next;
    }
    if ( $loc < $#s )
    {
        push @dist, 1 .. ($#s - $loc);
    }
    return \@dist;
}

sub runTest
{
    use Test::More;

    is_deeply( shortest("loveleetcode", 'e'), [3,2,1,0,1,0,0,1,2,2,1,0], "Example 1");
    is_deeply( shortest("aaab", 'b'), [3,2,1,0], "Example 2");

    is_deeply( shortest("ab", 'x'), [undef, undef], "no x in str");
    is_deeply( shortest("", 'x'), [], "empty string");

    is_deeply( sd2("loveleetcode", 'e'), [3,2,1,0,1,0,0,1,2,2,1,0], "sd2 Example 1");
    is_deeply( sd2("aaab", 'b'), [3,2,1,0], "sd2 Example 2");

    is_deeply( sd2("ab", 'x'), [undef, undef], "sd2 no x in str");
    is_deeply( sd2("", 'x'), [], "sd2 empty string");

    is_deeply( sd3("loveleetcode", 'e'), [3,2,1,0,1,0,0,1,2,2,1,0], "sd3 Example 1");
    is_deeply( sd3("aaab", 'b'), [3,2,1,0], "sd3 Example 2");

    is_deeply( sd3("ab", 'x'), [undef, undef], "sd3 no x in str");
    is_deeply( sd3("", 'x'), [], "sd3 empty string");

    done_testing;
}
