#!/usr/bin/env perl
use v5.36;

same_string(['ab', 'c'], ['a', 'bc']);
same_string(['ac', 'b'], ['a', 'bc']);
same_string(['the', 'cat', 'sat', 'on', 'the', 'mat'], ['thec', 'atsa', 'tont', 'hema', 't']);
same_string(['the', 'cat', 'sat', 'on', 'the', 'mat'], ['the', 'dog', 'sat', 'on', 'the', 'rug']);

sub same_string {
	
	# show input
	say qq[\nInput:  \@arr1 = ('] . join(q[', '], @{$_[0]}) . q[')];
	say qq[        \@arr2 = ('] . join(q[', '], @{$_[1]}) . q[')];
	
	# show output by comparing the joins of the 2 arrays
	say qq[Output: ] . (join('', @{$_[0]}) eq join('', @{$_[1]}) ? 'true' : 'false');
}
	
