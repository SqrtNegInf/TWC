#!/usr/bin/env perl

use v5.36;

use List::Util qw/all/;

use Getopt::Long;
my $Verbose = 0;
my $DoTest  = 1;

use constant MINLENGTH => 3;

GetOptions("test" => \$DoTest, "verbose" => \$Verbose);
runTest() if $DoTest;

die "All args should be numeric" unless all { $_ =~ m/-?\d+/ } @ARGV;

my $answer = aslice(@ARGV); # Should validate all numbers
say join(", ", map { "(". join(",", $_->@*) .")" } $answer->@*);

sub aslice(@list)
{
    my @result = ();
    while ( @list >= MINLENGTH )
    {
        my $diff = $list[1] - $list[0];

        for ( my $i = 2; $i < @list && $list[$i] - $list[$i-1] == $diff ; $i++ )
        {
            # Push every sub-slice that is at least MINLENGTH long
            push @result, [ @list[0..$i] ] if $i >= (MINLENGTH -1 );
        }
        shift @list;
    }
    return [ sort { scalar(@$a) <=> scalar(@$b) } @result ];
}

sub runTest
{
    use Test2::V0;

    is( aslice( 1,2,3,4 ), [ [1,2,3], [2,3,4], [1,2,3,4] ],  "Example 1");
    is( aslice( 2       ), [ ],                              "Example 2");
    is( aslice( 1,2,4,6,9,15,20,25,30,37 ),
        [ [2,4,6], [15,20,25], [20,25,30], [15,20,25,30] ],  "Bigger list, more diffs");
    is( aslice( 2,3,5,8,13,21 ), [],                         "No runs of 3");
    is( aslice( 3,6,4,7,10 ), [[4,7,10]],                    "Non-monotonic");
    is( aslice( 9,3,1,-1 ), [ [3,1,-1] ],                    "Negative difference");

    done_testing;
}

