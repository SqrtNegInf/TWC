#!/usr/bin/env perl
use v5.36;

use List::Util qw / all /;

my @list = <9 10 7 5 6 1>;

die Usage() unless @list;

my @answer;

while ( my $leader = shift(@list) )
{
    if ( all { $leader > $_ } @list )
    {
        push @answer, $leader;
    }
}
say "( @answer )";
