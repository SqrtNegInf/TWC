#!/usr/bin/env perl
use v5.36;

#
# A recursive definition of a palindrome:
#      - Empty, but followed by a digit          (1)
#      - A decimal dot, but followed by a digit  (1)
#      - A single digit
#      - A digit, followed by a palindrome, followed by the same digit
#
# (1) The "followed by a digit" is to prevent an empty string, or a 
#     a lone dot to be considered a palindrome.
#
# We also wrap the pattern into a script run assertion; this means we
# accept palindromes from different scripts -- but we don't allow mixing
# scripts. 
#
# That is, we accept
#      "\N{TAMIL DIGIT ONE}\N{TAMIL DIGIT TWO}\N{TAMIL DIGIT ONE}"
#
# But not 
#      "\N{TAMIL DIGIT ONE}\N{THAI DIGIT TWO}\N{TAMIL DIGIT ONE}"
#
# As the latter mixes digits from two different scripts.
#

# Unicode case not working on DATA handle
#binmode *STDIN, ':utf8';

say /^(*sr: (?<PAL> \.?(?=\d) | \d | (\d) (?&PAL) \g{-1}))$/x ? 1 : 0 while <DATA>;


__END__
2002
111
0
123.321
