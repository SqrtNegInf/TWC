#!/usr/bin/env perl
use v5.36.0;

sub Rshp {my $mtrx=shift(@_);my $rrow=shift(@_);my $rclm=shift(@_);my @m1mn=();my $rsar=0; # ReShape ArrayRef just zero if haven't reshaped yet;
  if    (ref($mtrx) ne 'ARRAY' && $mtrx =~ /^[\[0-9,\] ]+$/) { $mtrx=eval("$mtrx"); } # take '[[1,2],[3,4]]' string scalar && eval it into matrix array-ref;
  for            (@{$mtrx}) { say '[ ' . "@{$_}" . ' ]';
    for my $elem (@{$_   }) { push(@m1mn,$elem); } } # make new input matrix that's just 1 row x (m*n) columns flattened together;
  print "\$r = $rrow, \$c = $rclm => ";
  if (@m1mn == $rrow*$rclm) {            $rsar =[] ; # make sure total number of elems is same as new rows x columns target dimensions;
    for   my $rowc (0..$rrow-1) { push(@{$rsar},[]);
      for my $clmc (0..$rclm-1) { push(@{$rsar->[-1]},$m1mn[$rowc*$rclm+$clmc]); } } }
  if             ( !$rsar ) { say "$rsar;"; } else { my $fncf=1;print '[ '; # set FirstNoCommaFlag;
    for          (@{$rsar}) { if ($fncf) { $fncf=0; } else { print ', '; }
      print                       '[ ' . "@{$_}" . ' ]'; }
    say ' ];'; }
  return(           $rsar );
}
if    (@ARGV) {
  Rshp(@ARGV);
} else {
  Rshp([[1,2  ],[3,4  ]],1,4); # => [[1,2 , 3,4      ]];
  Rshp([[1,2,3],[4,5,6]],3,2); # => [[1,2],[3,4],[5,6]];
  Rshp([[1,2  ]        ],3,2); # =>   0                ;
}
