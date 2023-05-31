#!/usr/bin/env perl
use v5.36;

say("Input: $_\nOutput:", ("$_" eq reverse "$_")?1:0) foreach <101 0 1991>;
