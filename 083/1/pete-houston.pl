#!/usr/bin/env perl
use v5.36;

my @ARGV = 'Markmið lífs okkar er að vera hamingjusöm';
my ($str) = $ARGV[0] =~ /^\S*(.*?)\S*$/s; # Drop first and last words
my $charcount = $str =~ tr/ \011\012//c;  # Count non-whitespace remaining
print "$charcount\n";                     # Result
