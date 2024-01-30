#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Data::Dumper;
use List::Util qw/sum/;

my $cases = [
	[
		[1, 1, 0, 0, 0],
		[1, 1, 1, 1, 0],
		[1, 0, 0, 0, 0],
		[1, 1, 0, 0, 0],
		[1, 1, 1, 1, 1],
	],
	[
		[1, 0, 0, 0],
		[1, 1, 1, 1],
		[1, 0, 0, 0],
		[1, 0, 0, 0],
	]
];

sub weakest_row
{
	my $m = shift;

    my %h;
	for my $i (0..$#$m) {
		$h{$i} = sum($m->[$i]->@*);
	}
    
    my @res = sort {
					$h{$a} == $h{$b} ? $a <=> $b : $h{$a} <=> $h{$b}
                   } keys %h;
    return \@res;
}

is(weakest_row($cases->[0]), [2, 0, 3, 1, 4], 'Example 1');
is(weakest_row($cases->[1]), [0, 2, 3, 1],    'Example 2');
done_testing();

exit 0;

         
