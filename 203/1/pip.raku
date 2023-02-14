#!/usr/bin/env raku

sub SQud {my @nums=@_;my $sqdz=0;
  for             0..@nums.elems-4 -> $andx {
    for     $andx+1..@nums.elems-3 -> $bndx {
      for   $bndx+1..@nums.elems-2 -> $cndx {
        for $cndx+1..@nums.elems-1 -> $dndx {
          if (@nums[$andx] + @nums[$bndx] + @nums[$cndx] == @nums[$dndx]) { $sqdz++;
#           say "\@nums[$andx] + \@nums[$bndx] + \@nums[$cndx] == \@nums[$dndx]";
          } } } } }
  print '(' ~ sprintf("%-9s",join(',',@nums)) ~ ') => ';
  say    $sqdz ~ ';';
  return($sqdz);
}
if    (@*ARGS) {
  SQud(@*ARGS);
} else {
  SQud(1,2,3,6  ); # => 1
  SQud(1,1,1,3,5); # => 4
  SQud(3,3,6,4,5); # => 0
  SQud(<9 0 1 2 3 4 5 6>); # => 7
}
