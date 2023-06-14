#!/usr/bin/env perl
use v5.36;

srand 1;

# We get random length for the string, but we leave it to the user to explore a fixed length
my $range = shift @ARGV || rand(24);

# String Length
my $len = rand($range);

# String Generator
my $lisp = '';
$lisp .= rand() < 0.5 ? '(' : ')' for 0 .. $len;

print "Generated: $lisp\n";

my $paired_matches = $lisp =~ s/\(\)//g;
$paired_matches = $lisp =~ s/\(\)//g while $paired_matches;

print "Un-paired brackets: $lisp\n";
print length ($lisp) > 0 ? "It's NOT balanced\n" : "It's balanced!\n";
