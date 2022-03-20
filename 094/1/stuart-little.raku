#!/usr/bin/env raku
use v6;

# run as <script> <space-separated words>

for <opt bat saw tab pot top was>.classify(*.comb.Bag).values.sort {.say}
