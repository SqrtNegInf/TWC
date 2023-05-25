#!/usr/bin/env perl
use v5.36;

use List::Util 'max';
use Getopt::Std 'getopts';

# Parse the command line options and args
my $verbose = 0;
{
	my %opts;
	getopts ('v', \%opts);
	$verbose++ if $opts{v};
}

my ($n) = $ARGV[0] // 60;

# Loop through the sequence up to the Nth entry
my $x = 1;
for (2 .. $n) {
	print "$x\n" if $verbose;
	$x = next_seq ($x);
}
print "$x\n";

# Generate the next element of the sequence from the current one.
sub next_seq {
	my $cur = shift;

	# Handle the trivial case
	return $cur + 1 unless substr ($cur, -1) eq 3;

	# Find the last non-3 and increment from there
	my $loc = max rindex ($cur, 1), rindex ($cur, 2);

	if ($loc < 0) {
		# They're all threes, so replace them all with repetitions of
		# '21' and prepend with 1
		my $new = "1$cur";
		$new =~ s/33/21/g;
		$new =~ s/3$/2/;
		return $new;
	}

	# Increment the last non-3 and replace the 3s following it with the
	# minimal pattern which is '12121212...'
	my $lastnon3 = substr $cur, $loc, 1;
	my $new      = $cur;
	my $len      = length $cur;
	my $rstr     = $lastnon3 + 1 . string_fill ('12', $len - $loc - 1);

	substr $new, $loc, $len - $loc + 1, $rstr;

	return $new;
}

# Given a pattern to repeat and a length, return a string of precisely
# that length filled with the pattern.
sub string_fill {
	my ($pat, $len) = @_;
	my $lpat = length $pat;
	my $buf = $pat x ($len / $lpat);
	$buf .= substr ($pat, 0, $len % $lpat);
	return $buf;
}
