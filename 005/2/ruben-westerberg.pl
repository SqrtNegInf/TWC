#!/usr/bin/env perl
use v5.36;

my $wordsFile = 'words';
open my $wfh ,"<", $wordsFile;
my @words;
my %bag;
my $maxLetters;
my $maxCount=-1;
while (<$wfh>) {
	chomp;
	my $key= join '', sort split '';
	$bag{$key}++;
	if ( $bag{$key} > $maxCount) {
		$maxLetters = $key;
		$maxCount= $bag{$key};
	}
}

close $wfh;
print "$maxLetters has $maxCount anagrams\n";


