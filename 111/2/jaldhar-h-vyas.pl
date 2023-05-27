#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my $filename = shift // '/usr/share/dict/words';

open my $file, '<' , $filename or die "$OS_ERROR\n";
local $RS = undef;
my @lines = split "\n", <$file>;
close $file;

my $longest = q{};

for my $line (@lines) {
    chomp $line;
    if (lc $line eq (join q{}, sort split //, lc $line) &&
    length $line > length $longest) {
        $longest = $line;
    }
}

say $longest;
