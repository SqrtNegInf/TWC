#!/usr/bin/env perl
use v5.36;

my $sentence = "I love Perl";
goat_latin($sentence);

$sentence = "Perl and Raku are friends";
goat_latin($sentence);

$sentence = "The Weekly Challenge";
goat_latin($sentence);

exit 0;

sub goat_latin {
    my $sentence = shift;

    my $tail = '';
    printf "sentence '%s' -> '%s'\n",
        $sentence,
        join ' ', map { my $word = $_; $tail .= 'a'; ; $_ = $word . $tail }
                  map { $_ =~ /^[aeiou]/i
                          ? $_ . 'ma'
                          : (substr $_, 1) . (substr $_, 0, 1) . 'ma'
                      }
                    split / /, $sentence;
}
