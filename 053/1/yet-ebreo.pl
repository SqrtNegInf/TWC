#!/usr/bin/env perl
use strict;
use warnings;
use feature 'say';

my @matrix = (
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ],
);

#Obfuscated routine to rotate array 90cw, because it's perl. :D
sub rotate {@{$_[0]}=map[map$_[0]->[-$_][$'],//..@{$_[0]}],0..~-@{$_[0]->[0]}}
rotate (\@matrix) for 1..($ARGV[0]||90)/90 % 4;
map {say "@{$_}"} @matrix;
