#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test::More;

sub count_number
{
     my $num = $_[0];
     my @arr = split(//, $num);

     my @data;

     do { ( scalar @data == 0 or $_ != $data[-1][0] ) ? 
             push @data, [$_, 1] : $data[-1][1]++ }
          for @arr;
     my $output = join('',map { reverse @$_ } @data);
     return $output;
}


is(count_number(1122234), 21321314, 'Example 1');
is(count_number(2333445), 12332415, 'Example 2');
is(count_number(12345), 1112131415, 'Example 3');



done_testing();
