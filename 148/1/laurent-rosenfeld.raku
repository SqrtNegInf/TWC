#!/usr/bin/env raku

my @ebans = grep { ! /<[135789]>$/ and ! /<[12789]>\d/ }, 1..99;
say @ebans;
