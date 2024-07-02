#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my $sentence = "Perl Weekly Challenge";
my @keys = ('l', 'a');
broken_keys($sentence, \@keys);

$sentence = "Perl and Raku";
@keys = ('a');
broken_keys($sentence, \@keys);

$sentence = "Well done Team PWC";
@keys = ('l', 'o');
broken_keys($sentence, \@keys);

$sentence = "The joys of polyglottism";
@keys = ('T');
broken_keys($sentence, \@keys);

exit 0;

sub broken_keys {
    my $sentence = shift;
    my $keys = shift;

    printf "sentence '%s' keys (%s) -> %d\n",
        $sentence,
        (join ',', @keys), 
        (scalar split / /, $sentence) -
         sum map {
               my $tot = 0;
               my $word = lc($_);
               $tot += 1 if sum map { $_ = lc($_);
                                      $word =~ /$_/ ? 1 : 0 
                                    } @keys;
             } split / /, lc($sentence);
}
