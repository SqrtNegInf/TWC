#!/usr/bin/env perl
use v5.36;

my (@words, $words, $string, %pos);

$string = 'perlweeklychallenge';
@words  = ("weekly", "challenge", "perl");

# $string = 'perlandraku';
# @words  = ("python", "ruby", "haskell");

$words = join '', @words;

print 0 and exit if length($string) != length($words);

for my $word (@words) {
   my $i = index($string, $word);
   print 0 and exit if $i == -1;
   $pos{chr($i)} = $word;
}

my @result = map { $pos{$_} } sort keys %pos;
print "@result\n";

