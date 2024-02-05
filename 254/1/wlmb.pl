#!/usr/bin/env perl
use v5.36;

use POSIX qw(lround);

for(<27 33>){
    warn("$_ not integer"),next unless $_ == lround($_);
    say "$_ -> ", abs($_)==lround(abs($_)**(1/3))**3?"True":"False";
}
