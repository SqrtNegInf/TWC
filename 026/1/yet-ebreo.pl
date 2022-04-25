#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my $a = 'chancellor'; my $b = 'chocolate';
say eval "\$b=~y/$a//";

say 'chocolate' =~ y/chancellor//;
