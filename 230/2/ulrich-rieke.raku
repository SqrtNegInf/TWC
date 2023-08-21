#!/usr/bin/env raku

my $prefix = 'at';
my @words = ("pay", "attention", "practice", "attend");
say @words.grep( { $_ ~~ /^$prefix/ } ).elems ;
