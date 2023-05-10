#!/usr/bin/env perl
use v5.36;
no warnings 'uninitialized';

use List::Util qw(sum0);
use List::MoreUtils qw(pairwise);

my @isbnDigits = (grep/\d/,split//,shift // '978-0-306-40615-7')[0..11];
my @factors = split//,1313131313131;
say -(sum0 pairwise {$a*$b} @isbnDigits,@factors) % 10;
