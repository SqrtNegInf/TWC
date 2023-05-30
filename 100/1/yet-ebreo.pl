#!/usr/bin/env perl
use v5.36;

#one-liner? sure thing! :D
sub f { pop=~/:.. */&&sprintf"%02d%s",$`%12+12*($'?'pm'eq$':$`%12<1),$&.($`<12?'am':'pm')x!$' }

say &f('01:00 pm');
say &f('12:01 am');
say &f('12:00 pm');
say &f('12:00 am');
say &f('13:00');
say &f('00:00');
say &f('19:15');
