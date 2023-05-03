#!/usr/bin/env perl

use v5.36;
my (@tests, $test, @array, $target, $k, @x);

@x = split('', 'thequickbrownfoxjumpsoverthelazydog');
@tests = ([qw/e m u g/], 'b', [qw/d c e f/], 'a', [qw/j a r/], 'o', [qw/d c a f/], 'a', [qw/t g a l/], 'v', 
	\@x, 'm');

# loop over tests
TEST: while ($tests[0]) {
	
	# get inputs
	@array = @{ shift @tests };
	$target = shift @tests;
	say qq[\nInput:  \@array = qw/] . join(' ', @array) . qq[/, \$target = '$target'];
	
	# sort the array and get the first character > $target
	for $k (sort @array) {
		next unless ($k gt $target);
		say qq[Output: $k];
		next TEST;
	}
	say qq[Output: none];
}
