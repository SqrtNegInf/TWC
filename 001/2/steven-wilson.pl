#!/usr/bin/env perl

use v5.36;

#use strict;
#use warnings;
#use feature qw / say /;

map { if(!($_ % 3) && !($_ % 5)){ say 'fizz buzz'} else { if(!($_ % 3)){ say 'fizz'} elsif(!($_%5)) {say 'buzz'} else {say $_} }} 1..20;
