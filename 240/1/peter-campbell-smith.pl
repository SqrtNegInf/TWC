#!/usr/bin/env perl
use v5.36;

acronym(['Perl', 'Python', 'Pascal'], 'ppp');
acronym(['hyper', 'text', 'markup', 'language'], 'HTML');
acronym(['All', 'clients', 'receive', 'our', 'New', 'Year', 'message'], 'acronym');
acronym(['Once', 'upon', 'a', 'time'], 'tauo');

sub acronym {
	
	my (@str, $chk, $initials);
	
	# initialise
	@str = @{$_[0]};
	$chk = $_[1];
	
	# concatenate first letters of @str
	$initials = '';
	$initials .= lc(substr($_, 0, 1)) for @str;
	
	# show results
	say qq[\nInput:  \@str = ('] . join(q[', '], @str) . q[')];
	say qq[        \$chk = '$chk'];
	say qq[Output: ] . ($initials eq lc($chk) ? 'true' : 'false');
}
	
