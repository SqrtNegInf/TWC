#!/usr/bin/env perl

use v5.36;

use Getopt::Long;
my $DoTest  = 0;
my $Benchmark = 0;
my $Counter = 'saturn';

my %CountChar = (
    # Solution 1: delete everything that isn't char, use remaining length
    delete => sub($str, $char) { length( $str =~ s/[^$char]//gr )  },
 
    # Solution 2: Global match in list context yields an array of
    # matching characters. Assigning to scalar yields length of the list.
    match => sub($str, $char) { scalar( @{[ $str =~ m/$char/g ]} ) },

    # Solution 3: Same array/scalar idea, but use =()= to get context
    saturn => sub($str, $char) { my $occur =()= ( $str =~ m/$char/g ) },

    # Solution 4: turn string into array and count with grep
    splitgrep => sub($str, $char) { scalar( grep /$char/, split(//, $str) ) },

    # Solution 4a: use string compare instead of RE in grep
    grepcmp => sub($str, $char) { scalar( grep {$_ eq $char} split(//, $str) ) },

    # Solution 5: count with tr///, needs eval to interpolate
    treval => sub($str, $char) { eval "\$str =~ tr/$char//d" },
);

GetOptions("test" => \$DoTest, "benchmark:i" => \$Benchmark, "counter:s" => \$Counter);
runTest();  exit;

say pctOfChar(@ARGV, $CountChar{$Counter});


sub pctOfChar($str, $char, $counter)
{
    my $occur = $counter->($str, $char);
    return int( 100*($occur / length($str)) + 0.5 );
}

sub runTest
{
    use Test2::V0 -no_srand;

    for my $countFunc ( sort keys %CountChar )
    {
        is( pctOfChar("perl",      "e", $CountChar{$countFunc}), 25, "Example 1 perl e $countFunc");
        is( pctOfChar("java",      "a", $CountChar{$countFunc}), 50, "Example 2 java a $countFunc");
        is( pctOfChar("python",    "m", $CountChar{$countFunc}),  0, "Example 3 python m $countFunc");
        is( pctOfChar("ada",       "a", $CountChar{$countFunc}), 67, "Example 4 ada a $countFunc");
        is( pctOfChar("ballerina", "l", $CountChar{$countFunc}), 22, "Example 5 ballerina l $countFunc");
        is( pctOfChar("analitik",  "k", $CountChar{$countFunc}), 13, "Example 6 analitik k $countFunc");

        is( pctOfChar("rrrr", "r", $CountChar{$countFunc}), 100, "100% $countFunc");
    }

    done_testing;
}
