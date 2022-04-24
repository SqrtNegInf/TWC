#!/usr/bin/env perl
use Modern::Perl;

# Write a script to check the file content without explicitly reading the content. 
# It should accept file name with path as command line argument and print 
# "The file content is binary." or else "The file content is ascii." accordingly.

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
