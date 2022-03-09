#!/usr/bin/env perl
use warnings;
use strict;
use feature qw{ say };

my $MAX_NUMBER = 15;

my %expected;
@expected{1 .. $MAX_NUMBER} = ();
delete $expected{ (/^([0-9]+)/)[0] } while <DATA>;
say for keys %expected;

__END__
11, Line Eleven
1, Line one
9, Line Nine
13, Line Thirteen
2, Line two
6, Line Six
8, Line Eight
10, Line Ten
7, Line Seven
4, Line Four
14, Line Fourteen
3, Line three
15, Line Fifteen
5, Line Five
