#!/usr/bin/env raku

use MONKEY-SEE-NO-EVAL;

sub Rshp {my $mtrx=shift(@_);my $rrow=shift(@_);my $rclm=shift(@_);my @m1mn=();my $rsar=0; # ReShape ArrayRef just zero if haven't reshaped yet;
  if    ( $mtrx.WHAT.^name ne 'List' && $mtrx ~~ /<[\[\d\,\]\s]>+/) { $mtrx=EVAL("$mtrx"); } # take '[[1,2],[3,4]]' string && EVAL it into matrix array-ref;
  for   (@$mtrx) { say '[ ' ~ "@$_[]" ~ ' ]';
    for  @$_ -> $elem  { @m1mn.push($elem); } } # make new input matrix that's just 1 row x (m*n) columns flattened together;
  print "\$r = $rrow, \$c = $rclm => ";
  if (@m1mn.elems ==  $rrow*$rclm) {$rsar=          [] ; # make sure total number of elems is same as new rows x columns target dimensions;
    for   0..$rrow-1 -> $rowc {    @$rsar     .push([]);
      for 0..$rclm-1 -> $clmc {    @$rsar[*-1].push(@m1mn[$rowc*$rclm+$clmc]); } } }
  if             (!$rsar) { say    "$rsar;"; } else { my $fncf=1;print '[ '; # set FirstNoCommaFlag;
    for          (@$rsar) { if ($fncf) { $fncf=0; } else {       print ', '; }
      print            '[ ' ~ "@$_[]" ~ ' ]'; }
    say ' ];'; }
  return(          $rsar );
}
if    (@*ARGS) {
  Rshp(@*ARGS);
} else { my $ilst; # have to pass Input LiST already in scalar since it seems function call syntax flattens embedded lists into the argument list;
  $ilst=((1,2  ),(3,4  ));Rshp($ilst,1,4); # => [[1,2 , 3,4      ]];
  $ilst=((1,2,3),(4,5,6));Rshp($ilst,3,2); # => [[1,2],[3,4],[5,6]];
  $ilst=((1,2  ),       );Rshp($ilst,3,2); # =>   0                ;
}
