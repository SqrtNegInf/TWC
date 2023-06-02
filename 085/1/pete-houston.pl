#!/usr/bin/env perl
use v5.36;

my $ge = 1;
my $lt = 2;
my @valid = grep { $_ < $lt } (1.2, 0.4, 0.1, 2.5);
if ($#valid < 2) {
	print "0\n";
	exit;
}

find_sum (3, $ge, $lt, @valid);
print "0\n";

sub find_sum {
	my ($count, $ge, $lt, @num) = @_;
	if ($count < 2) {
		my $res = grep { $_ >= $ge && $_ < $lt } @num;
		if ($res) {
			print "1\n";
			exit;
		}
		return;
	}
	for my $i (0 .. $#num) {
		my $diff = $num[$i];
		my @new  = @num;
		splice (@new, $i, 1);
		find_sum ($count - 1, $ge - $diff, $lt - $diff, @new);
	}
}
