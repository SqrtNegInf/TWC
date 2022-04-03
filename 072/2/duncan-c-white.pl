#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
#use Function::Parameters;
#use Data::Dumper;

my $from = shift //3;
my $to = shift //6;

die "line-range: 1 <= FROM <= TO ($from..$to given)\n"
	unless $from>=1 && $to>=$from;

while( <DATA> )
{
	print if $. >= $from && $. <= $to;
}

__END__
L1
L2
L3
L4
L5
L6
L7
L8
L9
