#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
my $doTest=1;
my $verbose;
GetOptions("test" => \$doTest, "verbose" => \$verbose);
exit(!runTest()) if $doTest;

sub Usage { "$0 'string' 'str'" }

my $S = shift;
my $T = shift;
die Usage() unless $S;
die Usage() unless $T;

say uniqSubSeq($S, $T);

sub uniqSubSeq($s, $t)
{
    return findNextLetter($s, $t, 0);
}

sub findNextLetter($s, $t, $count)
{
    return $count unless $s && $t;
    my $c = substr($t, 0, 1);
    my $isLastChar = ( length($t) == 1 );
    
    my $p = index($s, $c);
    say "ENTER: s=[$s] t=[$t] c=[$c] p=[$p] count=[$count]" if $verbose;
    while ( $p != -1 )
    {
        if ( $isLastChar )
        {
            $count++;
        }
        else
        {
            $count = findNextLetter( substr($s, $p+1), substr($t, 1), $count );
        }
        $p = index($s, $c, $p+1);
        say " LOOP: s=[$s] t=[$t] c=[$c] p=[$p] count=[$count]" if $verbose;
    }
    return $count;
}

sub runTest
{
    use Test::More;

    is( uniqSubSeq("",         "a"),       0);
    is( uniqSubSeq("a",         ""),       0);
    is( uniqSubSeq("a",        "a"),       1);
    is( uniqSubSeq("a",        "b"),       0);
    is( uniqSubSeq("aa",       "a"),       2);
    is( uniqSubSeq("littleit", "lit"),     5);
    is( uniqSubSeq("london",   "lon"),     3);

    done_testing;
}
