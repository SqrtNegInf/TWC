#!/usr/bin/env perl
use v5.36;

sub swap_nibbles {
     my $bin = sprintf("%b",$_[0]);
     my $swapped = $bin;
     if ( length($bin) > 4 )
     {
          while ( length($bin) % 4 )
          {
               $bin = 0 . $bin;
          } 
          my @nibbles = unpack("(A4)*", $bin);


          @nibbles = @nibbles[-1, 0];
          $swapped = join('', @nibbles);
     }

     return oct("0b" . $swapped);
}

for my $num ( 101, 18 ) {
     print join("\t", $num, swap_nibbles($num)), $/;
}
