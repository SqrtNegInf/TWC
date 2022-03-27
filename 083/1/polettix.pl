#!/usr/bin/env perl
use 5.024;
use warnings;
use experimental qw< postderef signatures >;
no warnings qw< experimental::postderef experimental::signatures >;

say words_length(shift || 'Markmið lífs okkar er að vera hamingjusöm');

sub words_length ($text) {
    length($text =~ s{\A\s*\S+|\s+|\S+\s*\z}{}grmxs);
}
