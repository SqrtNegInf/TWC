#!/usr/bin/env raku

sub res(@strs) { zip(@strs).map(-> @s {@s.classify({$_}).max(*.value.elems).value.head}) }

sub toflip(@target,@strs) { @strs.map(-> @s {(@s Z!== @target).grep({$_}).elems}).sum }

my @strs = '101100101'.comb.rotor(3);
my @target = res(@strs.List);

say qq|Flip a total number of {toflip(@target,@strs)} positions to get {@target.join} from\n{@strs.map(*.join).join("\n")}|
