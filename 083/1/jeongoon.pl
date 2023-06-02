#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

my @words;

@words = split /\s/, 'Markmið lífs okkar er að vera hamingjusöm';
#@words > 2 or usage, exit 2;

say(
    sum
    map {length}        # count each length
    @words[
           1            # from the second word
           ..
            $#words-1   # to   the second last one
          ]
   );
