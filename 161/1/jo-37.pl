#!/usr/bin/env perl
use v5.36;

use constant DICT => 'dictionary.txt';
use List::Util 'reduce';
use Syntax::Keyword::Gather;

# Specify the name of a dictionary as program argument or use the
# provided dictionary otherwise.
$ARGV[0] = DICT unless @ARGV;

say for sort {length($b) <=> length($a) || $a cmp $b} gather {
    while (<>) {
        chomp;
        take $_ if reduce {$a && $a le $b ? $b : ''} split //;
    }
};
