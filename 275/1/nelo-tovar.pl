#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    {sentence => "Perl Weekly Challenge", keys => ['l', 'a'] },
    {sentence => "Perl and Raku", keys => ['a']},
    {sentence => "Well done Team PWC", keys => ['l', 'o']},
    {sentence => "The joys of polyglottism", keys => ['T']},
);

sub broken_keys {
    my $e = shift;
    my @words = split(/\W+/,lc($e->{sentence}));
    my $keys = lc(join('', $e->{keys}->@*));

    return scalar grep(!/[$keys]/, @words)
}

for my $elements (@examples) {
    my $bk = broken_keys $elements;

    printf "Input : sentence = '%s' keys = %s\n", $elements->{sentence}, dump($elements->{keys});
    say 'Output : ', $bk;
    say ' ';
}
