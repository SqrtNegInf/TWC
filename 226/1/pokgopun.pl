#!/usr/bin/env perl

sub sortString{
	my @str = split //, shift;
	my %m;
	$m{$_[$_]} = $str[$_] foreach 0..$#_;
	return join("", @m{0..$#str});
}

foreach (["lacelengh",3,2,0,5,4,8,6,7,1], ["rulepark",4,7,3,1,0,5,2,6]){
	printf "Input: \$string = '%s', \@indices = (%s)\nOutput: '%s'\n\n",
	$_->[0],
	join(",", @{$_}[1..$#{$_}]),
	sortString(@$_);
}

