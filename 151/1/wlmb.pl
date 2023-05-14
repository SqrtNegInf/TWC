#!/usr/bin/env perl
use v5.36;
use Try::Tiny;

for my $tree ('1 | 2 3 | 4 * * 5 | * 6'){
    my @rows=split /\s*\|\s*/, $tree; # separate into rows.
    my $depth=0;   # Depth of first row is 1. This is above the first row
    try {
	foreach(@rows){
	    s/((\S)+)/$2/g; # replace contiguous characters by first
	    s/\s+//g; # remove spaces
	    die "\n" if length > 2**$depth; # row can't be larger than 2**depth
	    $_.=("*" x(2**$depth-length)); # Fill row with asterisks if necessary
	    # Two consecutive asterisks at even-odd position mean we are below a leave
	    # so we have finished our search;
	    last if m/^(..)*(\*\*)/;
	    ++$depth;  # increase and iterate
	}
	say "Input: $tree\nOutput: $depth";
    }
    catch { say "A row is too long in $tree";}
}
