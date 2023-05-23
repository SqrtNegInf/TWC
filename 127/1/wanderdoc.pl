#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);

sub check_sets
{
     my ($aref_1, $aref_2) = @_;
     return (scalar @$aref_1 + scalar @$aref_2 == uniq(@$aref_1, @$aref_2)) ? 
          1 : 0;
}

print check_sets([1,2,3,5,4], [4,6,7,8,9]), $/;
print check_sets([1,3,5,7,9], [0,2,4,6,8]), $/;
