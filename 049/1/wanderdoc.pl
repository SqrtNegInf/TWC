#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use Math::BigInt;
Math::BigInt->accuracy(30);
use Time::HiRes qw[ time ];



my $NUM = 55;
my $start = time;

my $FLAG_2_5 = ($NUM % 2 == 0 or $NUM % 5 == 0) ? 1 : 0;

for my $i (1  .. 1_000_000_000)
{
     my $multiple = sprintf("%b", $i);
     if ( $FLAG_2_5 == 1 and substr($multiple, -1, 1) eq '1' ) {next; }

     if ( length($multiple) > 17 )
     {


          my $x = Math::BigInt->new($multiple);
          my $modulo = $x->bmod($NUM);
          if (0 == $modulo)
          {
               print $multiple, $/; last;
          }
     }


     else
     {
          if ( 0 == $multiple % $NUM )
          {
               print $multiple, $/; last;
          }
     }
}

#print "Used time: ", time() - $start, $/;
