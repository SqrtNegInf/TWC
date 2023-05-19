#!/usr/bin/env perl
use v5.36;

my $n    = 9801;
my $root = sqrt $n;
my $len  = length $n;

print 0 + can_sum ($root, $n, 0) . "\n";

sub can_sum {
	my ($tot, $str, $subtot) = @_;
	return 1 if $subtot + $str == $tot;
	my $len = length ($str);
	for my $i (1 .. $len - 1) {
		my ($start, $rest) = $str =~ /^(\d{$i})(.*)$/;
		return 1 if can_sum ($tot, $rest, $subtot + $start);
	}
	return 0;
}
