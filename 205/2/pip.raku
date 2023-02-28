#!/usr/bin/env raku

sub Mxor {my @aray = @_;my $mxor = 0;my %maxr = ();my @srtd = ();
  if     (@aray.elems  ) {
    for         0 ..(@aray.elems-2)          {
      if (@aray.elems-1) {
        for ($_+1)..(@aray.elems-1) -> $scnd {
          my    $xor2   = (+@aray[$_]) +^ (+@aray[$scnd]);
#         say "(+@aray[$_]) +^ (+@aray[$scnd]) = $xor2;";
          %maxr{$xor2}  = 1;
          } } } }
  @srtd = sort +*, %maxr.keys;
  print '(' ~ sprintf("%-13s",join(',',@aray)) ~ ') => ';
  $mxor = @srtd[*-1] if (@srtd.elems && (%maxr{@srtd[*-1]}:exists));
  say    $mxor ~ ';';
  return($mxor);
}
if    (@*ARGS) {
  Mxor(@*ARGS);
} else {
  Mxor(1,2,3,4,5,6,7); # =>  7;
  Mxor(2,4,1,3      ); # =>  7;
  Mxor(10,5,7,12,8  ); # => 15;
}
