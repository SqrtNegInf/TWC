#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 0;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);

my $N = shift // 91011;
die usage() unless defined $N && $N >= 10;

runTest();

sub seqUpToLen($first, $maxLen)
{
    my @seq = ( $first );
    my $str = $first;
    while ( length($str) < $maxLen )
    {
        push @seq, ++$first;
        $str .= $first
    }
    return \@seq;
}

sub numberSequence($N)
{
    # Generate prefixes of every useful length from N.
    # The longest prefix we need is half the string.
    for my $n ( 1 .. int(length($N)/2) )
    {
        my $p = substr($N, 0, $n);
        say $p;

        # Generate the seqence starting from p, making the
        # number as long as N
        my $seq = seqUpToLen($p, length($N));
        my $str = join("", @$seq);
        say "p=$p seq=(@$seq) $str";

        if ( $str eq $N )
        {
            return join(",", @$seq);
        }
    }
    return $N;
}

sub runTest
{
    use Test::More;

    is_deeply(seqUpToLen(1, 2), [ 1, 2 ], "seqUpToLen 1 2");
    is_deeply(seqUpToLen(1, 4), [ 1, 2, 3, 4 ], "seqUpToLen 1 4");
    is_deeply(seqUpToLen(11, 5), [ 11, 12, 13 ], "seqUpToLen 11 5");

    is(numberSequence(1234), "1,2,3,4", "N=1234");
    is(numberSequence(91011), "9,10,11", "N=91011");
    is(numberSequence(10203), "10203", "N=10203");

    done_testing;
}

