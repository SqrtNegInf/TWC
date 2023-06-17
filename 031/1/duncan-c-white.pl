#!/usr/bin/env perl
use v5.36;

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
