#!/usr/bin/env perl
use v5.36;

use ntheory qw(hammingweight);

sub sort_by_one_bits{
  sort{hammingweight($a) <=> hammingweight($b) || $a <=> $b} @{$_[0]}
}

say join ' ', sort_by_one_bits([0,1,2,3,4,5,6,7,8]);
say join ' ', sort_by_one_bits([1024,512,256,128,64]);

