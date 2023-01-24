#!/usr/bin/env raku
# Note: I've just started learning Raku about a week ago so this is one of my first Raku scripts. I expect my code will typically resemble my probably around
#   intermediate skill-level of Perl5. Just getting stuff to work is cool but then trying to write proper Raku that diverges further is challenging;   -Pip

use v6;
#my $d8VS='N1ILG09J';

sub ASlc {my @aray=@_;my @slcz;
  print '(' ~ sprintf("%-7s",join(',',@aray)) ~ ') => ';
  loop   (my Int $i=   0;$i < @aray.elems-2;$i++) {
    if   ( @aray[$i+1]-@aray[$i] == @aray[$i+2]-@aray[$i+1] ) {
      @slcz.push( "(@aray[$i],@aray[$i+1],@aray[$i+2])" );
      my $msiz=2; # start with triplets then run to end of slice
      while (@aray.elems > $i+$msiz && @aray[$i+1]-@aray[$i] == @aray[$i+$msiz]-@aray[$i+$msiz-1]) { $msiz++; }
      if ($msiz > 3) {my $slic='(' ~ @aray[$i];
        for (1..$msiz-1) { $slic ~= ',' ~ @aray[$i+$_]; }
        $slic ~= ')';
        @slcz.push($slic);
      } } }
  if    (@slcz) { say join(', ',@slcz); }
  else          { say '() as no slice found.'; }
  return(@slcz);
}

#if (@*ARGS) {
#  ASlc(@*ARGS);
#} else {
  ASlc(1,2,3,4); # => (1,2,3), (1,2,3,4), (2,3,4)
  ASlc(2      ); # => () as no slice found.
#}
