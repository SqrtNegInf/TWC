#!/usr/bin/env raku

my $sentence = "Perl and Raku are friends";
$sentence ~~ s:i:g/<!after \S> ( <[aeiou]>   \S*)/{$0}ma/;
$sentence ~~ s:i:g/<!after \S> (<-[aeiou]>) (\S*)/{$1}{$0}ma/;

my (@words) = $sentence.words;
my $append = "a";
for @words {
    $_ ~= $append;
    $append ~= "a";
}
$sentence = @words.join(" ");
say $sentence;
