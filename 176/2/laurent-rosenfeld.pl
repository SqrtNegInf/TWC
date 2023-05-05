#!/usr/bin/env perl
use v5.36;
for (1..100) {print "$_ " unless ($_ + reverse $_) =~ /[02468]/}
