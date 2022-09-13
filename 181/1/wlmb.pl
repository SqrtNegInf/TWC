#!/usr/bin/env perl

use v5.36;
use Text::Wrap qw(wrap $columns $break);
$columns=62; $break=qr/\s/;
local $/ = ""; # paragraph mode
open my $fh, '<', 'paragraph.txt';
while($_ = <$fh>){ # for each paragraph
    chomp; # remove trailing newlines
    my @output;
    foreach(split /\./){ # For each sentence. Assume ends in "."
	my @words = split " "; # Separate into words. Assume a space even after punctuation.
	my @sorted_words = sort {fc $a cmp fc $b} @words;
	push @output, join(" ",  @sorted_words) . ". "; # join words and add ending "."
    }
    say wrap('', '', (join " ", @output), "\n");
}
