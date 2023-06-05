#!/usr/bin/env perl

use strict;
use warnings;

sorted_squares(-2, -1, 0, 3, 4);
sorted_squares(5, -4, -1, 3, 6);

sub sorted_squares {
   my @list = @_;
   print "Input: (" . join(", ", @list) . ")\n";
   print "Output: (" . join(", ", sort {$a<=>$b} map {$_*$_} @list) . ")\n";
}
