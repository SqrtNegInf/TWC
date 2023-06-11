#!/usr/bin/env perl
use v5.36;

use Lingua::EN::Numbers qw<num2en>;

say join ' ', grep { !(num2en($_) =~ /e/) } 0..100;

