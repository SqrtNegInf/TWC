#!/usr/bin/env perl
use v5.36;

my $a = 'chancellor'; my $b = 'chocolate';
say eval "\$b=~y/$a//";

say 'chocolate' =~ y/chancellor//;
