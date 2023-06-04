#!/usr/bin/env perl
use v5.36;

use Test::More;


sub rotate_multiple
{
     my ($aref, $idx) = @_;
     my @output;
     for my $n ( @$idx )
     {
          my @copy = @$aref;
          push @output, [ rotate_left([@copy], $n) ];
     }
     return @output;
}



sub rotate_left
{
     my ( $aref, $num) = @_;
     return @$aref[ map { ($_ + $num) % @$aref} 0 .. $#$aref ];
}




is_deeply([rotate_multiple([10, 20, 30, 40, 50], [3, 4])],
     [[40, 50, 10, 20, 30], [50, 10, 20, 30, 40]], 'Example 1');
is_deeply([rotate_multiple([7, 4, 2, 6, 3], [1, 3, 4])], 
     [[4, 2, 6, 3, 7], [6, 3, 7, 4, 2], [3, 7, 4, 2, 6]], 'Example 2');
done_testing();
