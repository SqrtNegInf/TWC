#!/usr/bin/env raku

sub TdHi {my @aray = @_;my $thrd = 0;my %uniq = ();my @srtd = ();
  print '(' ~ sprintf("%-7s",join(',',@aray)) ~ ') => ';
  for (@aray) { %uniq{$_} = 1; }
  @srtd = %uniq.keys.sort;
  $thrd = @srtd[*-1] if (@srtd.elems    );
  $thrd = @srtd[*-3] if (@srtd.elems > 2);
  say    $thrd ~ ';';
  return($thrd);
}
if    (@*ARGS) {
  TdHi(@*ARGS);
} else {
  TdHi(5,3,4  ); # => 3
  TdHi(5,6    ); # => 6
  TdHi(5,4,4,3); # => 3
}
