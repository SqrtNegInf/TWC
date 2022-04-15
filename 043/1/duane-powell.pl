#!/usr/bin/env perl
use warnings;
use strict;
use feature qw( say );
use Math::Combinatorics;

my @num = (1,2,3,4,6);
my $eleven = 11;

sub red    {return 9 + $_[0]};
sub green  {return 5 + $_[0] + $_[1]};
sub black  {return 0 + $_[0] + $_[1] + $_[2]};
sub yellow {return 7 + $_[0] + $_[1]};
sub blue   {return 8 + $_[0]};

my $c = Math::Combinatorics->new(count => 1, data => [@num]);
while (my @perm = $c->next_permutation) {
	next unless red($perm[0])                     == $eleven;
	next unless green($perm[0],$perm[1])          == $eleven;
	next unless black($perm[1],$perm[2],$perm[3]) == $eleven;
	next unless yellow($perm[3],$perm[4])         == $eleven;
	next unless blue($perm[4])                    == $eleven;

	# a solution found if we made it here
	say join(',',@perm); 
}
