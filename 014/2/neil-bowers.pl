#!/usr/bin/env perl

use File::Slurper qw/ read_lines /;

my @states = read_lines('states.txt');
my $re     = join('|', @states);
my @words  = grep { /^($re)+$/i }
             sort { length($b) <=> length($a) }
             read_lines('/usr/share/dict/words');

print $words[0], "\n";
