#!/usr/bin/env raku

sub RGrp { my @list = @_;my $size = pop(@list);my @slst = sort +*, @list;my @grpz = ();my $nfgf = 0;my %icnt = ();
  printf("list:(%-17s) size:$size => ", join(',', @list));
  if    (@slst.elems % $size) { say '-1;';return(-1); }
  for   (@slst) { %icnt{$_}++; } # count each integer in the sorted list
  while (@slst) { my $strt = @slst[0];push(@grpz, []);
    for (0..$size-1) { # looping backwards by subtracting $_ since best to loop backwards when splicing below
      if (       %icnt{$strt + ($size-1) - $_}:exists && %icnt{$strt + ($size-1) - $_}) { %icnt{$strt + ($size-1) - $_}--;
        unshift(@(@grpz[*-1]), $strt + ($size-1) - $_ );
        for (0..@slst.elems - 1) -> $lndx { # also looping backwards so that largest of size groups are removed first (which might not be necessary?)
          if (     @slst[@slst.elems - 1 - $lndx] ==           $strt + ($size-1) - $_ ) { splice(@slst, @slst.elems - 1 - $lndx, 1);last; } }
      } else                  { say '-1;';return(-1); } } } # failed to find complete group of size beyond start
  for   (@grpz) { if ($nfgf) { print ', '; } else { $nfgf = 1; } # test the NotFirstGroupFlag to print commas between groups
    print '(' ~ join(',', @($_))   ~ ')' ; }; say ';';
  return(@grpz);
}
if    (@*ARGS) {
  RGrp(@*ARGS);
} else {
  RGrp(1,2,3,5,1,2,7,6,3, 3); # => (1,2,3), (1,2,3), (5,6,7);
  RGrp(1,2,3            , 2); # => -1;
  RGrp(1,2,3            , 3); # => (1,2,3);             # Note: added test size:3 since this produces group!;
  RGrp(1,2,4,3,5,3      , 2); # => -1;                  # Note: (1,2), (3,4), (3,5) fails on the last group!;
  RGrp(1,2,4,3,5,3      , 3); # => (1,2,3), (3,4,5);    #*Note:*changed to size:3 to produce expected output;
  RGrp(1,5,2,6,4,7      , 3); # => -1;
  RGrp(1,5,2,6,4,7      , 2); # => (1,2), (4,5), (6,7); # Note: added test size:2 since this produces groups;
}
