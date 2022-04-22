#!/usr/bin/env perl
#
# Challenge 1: "Create a function to check divide by zero error without
#	      checking if the denominator is zero."
#
# My notes: so eval then?
# 

use v5.10;	# to get "say"
use strict;
use warnings;

my $a = 42;
my $b = 0;

my $x;
if( defined eval { $x = $a / $b } )
{
	say "$a / $b = $x";
} else
{
	say "error: $@";
}
