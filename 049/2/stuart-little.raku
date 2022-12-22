#!/usr/bin/env raku

# output not stable, change what's displayed
srand 1;

use lib 'lib';
use Cache::LRU;

my $size=(@*ARGS) ?? (@*ARGS[0].Int) !! (3);
my $cache = Cache::LRU.new(size => $size);

(1..$size).map({ $cache.set($_, ('a'..'z').roll(3).join)}); # say "key: $_,   value: {$cache.get($_)}" });

say "\nSetting new item at key {$size+1}..";
$cache.set($size+1, ('a'..'z').roll(3).join);
say "\nNew cache:";
(1..$size+1).map({ (my $val=$cache.get($_))}); # && say "key: $_,   value: {$val}" });

say $cache.get(1); # should  now be 'Nil'
