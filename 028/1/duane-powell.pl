#!/usr/bin/env perl
use v5.36;

my $file = $0;
if ($file) {
	if (-e $file) {
		say "The file $file content is binary" if (-B $file);
		say "The file $file content is ascii"  if (-T $file);
	} else {
		say "The file $file does not exist";
	}
} else {
	say "Usage: $0 filename";
}
