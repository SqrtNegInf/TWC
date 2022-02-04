#!/usr/bin/env raku

use Lingua::EN::Numbers;

put grep *.&cardinal.contains('e').not, 0..100;
