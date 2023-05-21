#!/usr/bin/env perl
use v5.36;

for my $n ( (1, 1234, 1234567) ) {
    $_ = $n;
	s/^-//;
	if (/([^0-9])/)   { print "Not an integer because of '$1'\n"; next; }
	my $len = length;
	if ($len < 3)     { print "Too few digits to extract 3\n";    next; }
	unless ($len % 2) { print "Even number of digits\n";          next; }
	print substr ($_, ($len - 3) / 2, 3) . "\n";
}
