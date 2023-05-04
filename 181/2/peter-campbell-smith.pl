#!/usr/bin/env perl
use v5.36;

my ($line, %input, $day, $yesterday);

# read the data into %input such that $input{date} = temp
while ($line = <DATA>) {
	$input{$1} = $2 if $line =~ m|(.+), (\d+)|;
}

# check each day against the previous one
$yesterday = 99;
for $day (sort keys %input) {
	say qq[$day was hotter ($input{$day}) than the previous day ($yesterday)] if $input{$day} > $yesterday;
	$yesterday = $input{$day};
}

__DATA__
2022-08-01, 20
2022-08-09, 10
2022-08-03, 19
2022-08-06, 24
2022-08-05, 22
2022-08-10, 28
2022-08-07, 20
2022-08-04, 18
2022-08-08, 21
2022-08-02, 25
