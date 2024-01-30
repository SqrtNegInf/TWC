#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples_words = (
    [ "one.two.three","four.five","six" ],
    [ '$perl$$', '$$raku$' ],
);
my @separators = ('.', '$');
         
sub split_string {
    my $separator = quotemeta(shift);
    my $words = shift;
    my @split;

    push(@split, grep {length $_} map({split(/$separator/, $_)} @$words));

    return \@split;
}

for my $elements (@examples_words) {
    my $separator = shift @separators;
    my $ss = split_string($separator, $elements);
  
    say 'Input     : @words = ', dump(@$elements);
    say '            $separator = ', $separator;
    say 'Output : ', dump(@$ss);
    say ' ';
}
