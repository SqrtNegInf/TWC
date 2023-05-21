#!/usr/bin/env perl
use v5.36;

my ($test, $count, $limit);

$limit = 5;        # how many do we want
$count = 0;		   # how many have we found

# start with the known first one and test subsequent integers
$test = 1023456789;
while (1) {
	if ($test =~ m|0| and $test =~ m|1| and $test =~ m|2| and $test =~ m|3| and $test =~ m|4|
		and $test =~ m|5| and $test =~ m|6| and $test =~ m|7| and $test =~ m|8| and $test =~ m|9|) {
		say $test;
		last if ++$count == $limit;
	}
	$test ++;
}
