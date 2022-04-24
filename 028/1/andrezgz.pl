#!/usr/bin/env perl

# https://perlweeklychallenge.org/blog/perl-weekly-challenge-028/
# Task #1
# Write a script to check the file content without actually reading the content.
# It should accept file name with path as command line argument and
# print "The file content is binary." or else "The file content is ascii." accordingly.

use strict;
use warnings;

my $file = $0;
die "'$file' is not a file" unless (-f $file );

# Maybe I'm cheating here because, being precise,
# the -T/-B test "reads" the first bytes of the file and then makes an educated guess

print 'The file content is ascii.' if -T $file;
print 'The file content is binary.' if -B $file;
