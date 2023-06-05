#!/usr/bin/env perl
use v5.36;

use List::Util 'max';


my @chart = getchart();
my @rows = makerowsfromchart(@chart);
my @contiguous = contiguousinrows(@rows);
my @squares = square(@contiguous);
my $biggestsquare = max(@squares);
say $biggestsquare;





sub getchart{
    <2 1 4 5 3 7>
   #(1,4,6,4,2,2,4,5,5)
}







sub makerowsfromchart{
   my $mx = max @_;
   my @rows;
   for my $row (1..$mx){
      for my $col (@_){
         push @{$rows[$row]}, int($col>=$row)
      }
   }
   @rows
}

sub contiguousinrows{
   my @longests;
   for my $row (1..$#_){
      my $str = join '',@{$_[$row]};
      my @contigs = ($str=~/(1+)/g);
      my @lengths =map{length($_)}@contigs;
      push @longests, [$row, max(@lengths)];
   }
   @longests
}


sub square{
   map{ $_->[0] * $_->[1] } @_
}





sub DEPRECATEDsquare{
   my @sqrd;
   push @sqrd, $_->[0] * $_->[1] for @_;
   @sqrd
}
