#!/usr/bin/env perl
use v5.36;

1 while ++$i and %h=map+( join('',sort split//,$i*$_) =>1 ),1..6 and 1<keys%h;
print"$i\n";
