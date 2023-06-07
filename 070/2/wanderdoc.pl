#!/usr/bin/env perl
use v5.36;

use Test::More;
sub gray_code
{
     my @seq = @{$_[0]};
     my $cnt = $_[1];

     my $bit = $_[2];
     
     while ( $cnt < $bit )
     {
          @seq = map sprintf("%0${cnt}b",$_), @seq;
          my @seq_2 = reverse @seq;


          @seq   = map '0' . $_, @seq;
          @seq_2 = map '1' . $_, @seq_2;
          push @seq, @seq_2;

          @seq = map oct("0b".$_), @seq;
          $cnt++;
     }
     return @seq;

}

is_deeply([gray_code([0, 1, 3, 2], 2, 3)], ([0, 1, 3, 2, 6, 7, 5, 4]), 'Example 1');
is_deeply([gray_code([0, 1, 3, 2], 2, 4)], 
     ([0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8]), 'Example 2');
is_deeply([gray_code([0, 1, 3, 2, 6, 7, 5, 4], 3, 4)],
     ([0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8]), 'Variation');
done_testing();
