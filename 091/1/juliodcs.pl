#!/usr/bin/env perl
use v5.36;

use Lingua::EN::Numbers 'num2en';

say((shift // 1122234) =~ s/((\d)\2*)/num2en(length $1)." $2 "/egr)
