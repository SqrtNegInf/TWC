#!/usr/bin/env perl
use v5.36;

countWords("at", "pay", "attention", "practice", "attend");
countWords("ja", "janet", "julia", "java", "javascript");

sub countWords($prefix, @list)
{
    say scalar grep { /^$prefix/ } @list;
}
