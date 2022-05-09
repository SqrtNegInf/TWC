#!/usr/bin/env perl

use 5.032;

use strict;
use warnings;
no  warnings 'syntax';

use experimental 'signatures';
use experimental 'lexical_subs';

my $file = 'words';

sub find_words ($file, $letters) {
    return if $letters =~ /[^a-z]/i;
    open my $fh, "<", $file or die "open $file: $!";
    while (my $word = <$fh>) {
        chomp $word;
        #
        # Remove each letter from (a copy of) $word.
        # If we end up with an empty string, we can
        # from $word from the letters of $letters.
        #
        my $copy = $word;
        $copy =~ s/\Q$_//i for split // => $letters;
        length ($copy) or say $word;
    }
}


while (my $letters = <DATA>) {
    chomp $letters;
    find_words $file => $letters;
}

__END__
crate
