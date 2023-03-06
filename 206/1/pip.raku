#!/usr/bin/env raku

sub ShTm {my @time = @_;my $shtm = 0;my @tmnz = ();my %tdfz = ();my $sinc = '';
  if     (   @time.elems) {
    for     (    0 .. (@time.elems - 2))          {
      if (   @time.elems - 1) {
        for (($_+1).. (@time.elems - 1)) -> $scnd {
          my @hhmm = split(':', @time[$_   ], :skip-empty);
          @tmnz[$_   ] = @hhmm[0] * 60 + @hhmm[1];
             @hhmm = split(':', @time[$scnd], :skip-empty);
          @tmnz[$scnd] = @hhmm[0] * 60 + @hhmm[1];
          if (@tmnz[$_   ] < @tmnz[$scnd]) {
            %tdfz{ @tmnz[$scnd]             - @tmnz[$_   ] } = "\"@time[$_   ]\" and \"@time[$scnd]\"";
            %tdfz{ @tmnz[$_   ] + (24 * 60) - @tmnz[$scnd] } = "\"@time[$scnd]\" and \"@time[$_   ]\"";
          } else                           {
            %tdfz{ @tmnz[$_   ]             - @tmnz[$scnd] } = "\"@time[$scnd]\" and \"@time[$_   ]\"";
            %tdfz{ @tmnz[$scnd] + (24 * 60) - @tmnz[$_   ] } = "\"@time[$_   ]\" and \"@time[$scnd]\"";
          } } } }
    if   (  %tdfz ) {
      my @stdf = sort +*, keys(%tdfz);
      $shtm = @stdf[0]; # max shortest time should be is 720 minutes for just 2 times exactly 12 hours off from each other
      $sinc = "Since the difference between %tdfz{$shtm} is the shortest ($shtm minutes).";
    } }
  printf("(%-34s) => %3d; %s\n", sprintf('"%s"', join('", "', @time)), $shtm, $sinc);
  return($shtm);
}
if    (@*ARGS) {
  ShTm(@*ARGS);
} else {
  ShTm("00:00", "23:55", "20:00"         ); # =>  5;
  ShTm("01:01", "00:50", "00:57"         ); # =>  4;
  ShTm("10:10", "09:30", "09:00", "09:55"); # => 15;
}
