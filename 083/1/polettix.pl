#!/usr/bin/env perl
use v5.36;

say words_length(shift || 'Markmið lífs okkar er að vera hamingjusöm');

sub words_length ($text) {
    length($text =~ s{\A\s*\S+|\s+|\S+\s*\z}{}grmxs);
}
