#!/usr/bin/env raku

my $prefix = 'at';
my @words  = ("pay", "attention", "practice", "attend");
my $count = 0;
$count++ if ( $_ ~~ / ^ $prefix / ) for @words;
$count.say;
