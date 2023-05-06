#!/usr/bin/env perl
use v5.36;

use List::Permutor;
use Array::Compare;

print &permutation2rank([1,0,2]),"\n"; # 2
print &rank2permutation([0,1,2],1),"\n"; # 021

sub permutation2rank ($rarry) {
	my $comp = Array::Compare->new(); 
	my $ctr=0;
	my $p = List::Permutor->new(sort @$rarry);
	while (my @set = $p->next) {
		last if $comp->compare($rarry,\@set);
		$ctr++;
	}
	return $ctr;
}

sub rank2permutation ($rarry, $rank) {
    my $ctr=0;
	my $p = List::Permutor->new(sort @$rarry);
	my @set=();
	while (@set = $p->next) {
		last if $ctr==$rank;
		$ctr++;
	}
	return @set;
}

