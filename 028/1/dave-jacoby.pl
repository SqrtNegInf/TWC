#!/usr/bin/env perl
use v5.36;

use Cwd 'abs_path';

for my $file ($0) {
    filetest($file);
}

sub filetest($file) {
    my $path = abs_path($file);
    return unless -e $path;
    return unless -f $path;
    say $file;
    if    ( -T $path ) { say "\tThe file content is ascii" }
    elsif ( -B $path ) { say "\tThe file content is binary" }
}

# the interesting thing is that zero-length files are accepted as both.
# to keep that from happening, I used elsif and assumed ascii first
