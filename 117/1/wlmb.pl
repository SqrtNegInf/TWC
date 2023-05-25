#!/usr/bin/env perl
use v5.36;

my %rows;
@rows{1..15}=map {"Line $_"} qw(one two three four five six seven eight nine
				ten eleven twelve thirteen fourteen fifteen);
my $count=0;
while(<DATA>){
    ++$count;
    die "Wrong format: $_" unless /^\s*(\d+),/;
    die "Wrong number: $_" unless defined $rows{$1};
    delete $rows{$1};
}
die "Not 14 lines" unless $count==14;
say "Missing row: $_, $rows{$_}" for keys %rows;

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
