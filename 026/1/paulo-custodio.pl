#!/usr/bin/env perl
use v5.36;

# Challenge 026
#
# Task #1
# Create a script that accepts two strings, let us call it, "stones" and
# "jewels". It should print the count of "alphabet" from the string "stones"
# found in the string "jewels". For example, if your stones is "chancellor" and
# "jewels" is "chocolate", then the script should print "8". To keep it simple,
# only A-Z,a-z characters are acceptable. Also make the comparison case
# sensitive.

use Modern::Perl;

say count(('chancellor', 'chocolate'));

sub count {
    my($letters, $word) = @_;
    my %letters; $letters{$_}=1 for grep {/\w/} split //, $letters;
    return scalar grep {$letters{$_}} split //, $word;
}
