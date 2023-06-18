#!/usr/bin/env perl
use v5.36;

my $file = $0;
die "'$file' is not a file" unless (-f $file );

# Maybe I'm cheating here because, being precise,
# the -T/-B test "reads" the first bytes of the file and then makes an educated guess

print 'The file content is ascii.' if -T $file;
print 'The file content is binary.' if -B $file;
