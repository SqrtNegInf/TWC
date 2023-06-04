#!/usr/bin/env perl
use v5.36;

#my ($arr, $ind) = get_inputs ();
my $arr = [10,20,30,40,50]; my $ind = [3,4];

my $res = rotate_arrays ($arr, $ind);
print "[@$_]\n" for @$res;

sub rotate_arrays {
	my ($arr, $ind) = @_;
	my @aoa;
	push @aoa, [@$arr[$_..$#$arr,0..$_-1]] for @$ind;
	return \@aoa;
}
