#!/usr/bin/env raku

sub SSAv { my @numz = @_;my $smav = 0;my $nsiz = @numz.elems;
  my       $spld = 2 ** $nsiz;
  while (--$spld) {
    my     $splb = sprintf("%0" ~ $nsiz ~ "b", $spld);my @bdgz = split('', $splb, :skip-empty);my @left = ();my @rite = ();my $lsum = 0;my $rsum = 0;
    for (0 .. @bdgz -   1 ) {
      if (@bdgz[$_] eq '1') {
        push(@rite, @numz[$_]);$rsum += @numz[$_]; }
      else                  {
        push(@left, @numz[$_]);$lsum += @numz[$_]; } }
    if  (@left.elems && @rite.elems && ($lsum / @left.elems) == ($rsum / @rite.elems)) {
#     say "splb:$splb avrg:" ~ ($lsum / @left.elems) ~ " left:@left[] rite:@rite[];";
      $smav = 1;last; } } # removing last here && uncommenting say above will show all 16 ways it works for average 4.5 for Example1 of 1..8
  printf("(%-22s) => $smav;\n", join(', ', @numz));
  return(            $smav);
}
if    (@*ARGS) {
  SSAv(@*ARGS);
} else {
  SSAv(1, 2, 3, 4, 5, 6, 7, 8); # => 1;
  SSAv(1,    3               ); # => 0;
}
