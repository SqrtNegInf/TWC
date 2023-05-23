#!/usr/bin/env perl
use v5.36;

print scalar grep {!/1/} 1..200||0;
