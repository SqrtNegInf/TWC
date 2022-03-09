#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


my %text;

while ( my $line = <DATA> )
{
     chomp $line;
     my ($nr, $row) = split(/\s*,\s*/, $line);
     $text{$nr} = undef;
}

my ($min, $max) = (sort {$a <=> $b} keys %text)[0, -1];
my %check;

$check{$_} = undef for $min .. $max;
delete @check{ keys %text };


print "$_$/" for keys %check; # 12

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
