#!/usr/bin/env perl
use v5.36;

use Test::More;

sub jump
{
     my @arr = @_; 
     die "Array with at least two elements required!$/" if $#arr == 0;

     my $i = 0;
     while ( $i < $#arr )
     {
          my $old_i = $i;
          $i += $arr[$i];
          return 0 if ($i == $old_i or $i > $#arr); 
     }
     return 1;
}

is(jump(1, 2, 1, 2),          1, 'Example 1');
is(jump(2, 1, 1, 0, 2),       0, 'Example 2');
is(jump(1, 3, 2),             0, 'Example 3');
is(jump(1, 1, 3, 2, 1, 0),    1, 'Example 4');
is(jump(1, 0),                1, 'Example 5');
is(jump(0, 1),                0, 'Example 5');
done_testing();
