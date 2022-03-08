#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use Scalar::Util qw(looks_like_number);

sub swap_bits
{
     my $num = $_[0];

     die "Number in range 1 to 255?$/" 
          unless looks_like_number($num) and
          $num == int($num) and
          ($num > 0 and $num < 256);
     my $binary = dec_to_bin($num);
     $binary = length($binary) % 2 ? 0 . $binary : $binary;
     my @bits = split(//, $binary);
     @bits[((grep {$_ % 2 == 0} 0 .. $#bits), (grep {$_ % 2 == 1} 0 .. $#bits))] =
     @bits[((grep {$_ % 2 == 1} 0 .. $#bits), (grep {$_ % 2 == 0} 0 .. $#bits))];
     $binary = join('', @bits);
     $num = bin_to_dec($binary);
     return $num;


}



for my $n ( 101, 18 )
{
     print join(' -> ', $n, swap_bits($n)), $/;
}

sub dec_to_bin { return sprintf("%b",$_[0]); }
sub bin_to_dec { return oct("0b" . $_[0]); }
