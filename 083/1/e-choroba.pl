#!/usr/bin/env perl
use warnings;
use strict;

# Substitution returns the number of substitutions.
sub words_length_subst {
    local ($_) = @_;
    s/^\S+//, s/\S+$//;
    return s/\S/ /g
}

# Or remove the words and all whitespace and measure the length.
sub words_length {
    local ($_) = @_;
    s/^\S+//, s/\S+$//, s/ //g;
    return length
}

# Transliteration returns the number of replaced chars and is fast.
sub words_length_trans {
    local ($_) = @_;
    s/^\S+//, s/\S+$//;
    return tr/\t\n\r\f\ck //c
}

use Test::More tests => 9;
my %examples = ('The Weekly Challenge'                    => 6,
                'The purpose of our lives is to be happy' => 23,
                'Markmið lífs okkar er að vera hamingjusöm' => 19);

for my $sub (\&words_length_subst, \&words_length, \&words_length_trans) {
    for my $example (keys %examples) {
        is $sub->($example), $examples{$example};
    }
}
