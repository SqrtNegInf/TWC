#!/usr/bin/env perl
use v5.36;

sub countReduct{
	my $count = shift;
	@_ = sort grep{$_>0} @_;
	return $count unless @_;
	return countReduct(++$count, map{$_ - $_[0]} @_[1..$#_]);
	}
foreach ([1, 5, 0, 3, 5], [0], [2, 1, 4, 0, 3]){
	printf "Input: \@ints = (%s)\nOutput: %d\n\n", join(", ",@$_), countReduct(0,@$_);
}

