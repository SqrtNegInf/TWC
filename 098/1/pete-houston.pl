#!/usr/bin/env perl
use v5.36;

my ($filename, $ENC) = 'input.txt';

my $len = 4;

# Read and print the whole file, $len characters at a time
while (my $data = readN ($filename, $len)) {
	print "$data\n";
	last if $len > length $data;
}

sub readN {
	my ($filename, $len) = @_;
	state %handles;

	unless (exists $handles{$filename}) {
		open $handles{$filename}, $filename;
	}
	my $chars = sysread $handles{$filename}, (my $text), $len;
	unless ($chars == $len) {
		# We have reached the end of the file. Close the handle and
		# remove it from the hash
		close $handles{$filename};
		delete $handles{$filename};
	}
	return $text;
}
