#!/usr/bin/env perl
use v5.36;

my @N = (100, 4, 50, 3, 2);
unless (scalar @N) {
	# @N is empty so fill with random numbers 
	push @N, int(rand(100))+1 for (1..40);
	print join(',',@N), "\n";
	
}

@N = sort @N;
my @longest;

# Init @temp with first elemenet of @N
my @temp = (shift @N); 
while (scalar @N) { 

	# Is the last element of @temp consecutive with the next element of @N ?
	if ( $temp[-1]+1 == $N[0] ) {
		# Yes, push element
		push @temp, shift @N;
	} 
	else {
		# No, re-init @temp with first element of @N
		@temp = (shift @N);
	}
		
	# Note: the winner of ties go to the first sequence found
	@longest = @temp if (scalar @temp > scalar @longest);

} 

say scalar(@longest) ? join(',',@longest) : 0;
exit;


