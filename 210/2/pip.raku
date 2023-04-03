#!/usr/bin/env raku

sub NCli { my @list = @_;my @mvls = @list;my $done = 0;
  while (!$done) {
    for (0 .. (@mvls.elems - 2)) {
      if      (@mvls[$_] >= 0 && @mvls[$_ + 1] <  0) {
       #say "ndxz:$_ and +1 posi:@mvls[$_] collides with nega:@mvls[$_ + 1]...;";
        if    (abs(@mvls[$_]) == abs(@mvls[$_ + 1])) { splice(@mvls, $_    , 2); }
        elsif (abs(@mvls[$_]) <  abs(@mvls[$_ + 1])) { splice(@mvls, $_    , 1); }
        else                                         { splice(@mvls, $_ + 1, 1); }
        last; } } # any collision and splice should leave the loop to start over before finding the next collision
    $done = 1;
    for (0 .. (@mvls.elems - 1)) {
      if      (@mvls[$_] <  0) { #    look for any positives to the left  of any negatives
        for (      0  .. ($_          - 1)) -> $nndx {
          if ( @mvls[$nndx] >= 0) { $done = 0;last; } }
      } else {                   # && look for any negatives to the right of any positives
        for (($_ + 1) .. (@mvls.elems - 1)) -> $pndx {
          if ( @mvls[$pndx] <  0) { $done = 0;last; } }
      } } }
  printf("(%-8s) => (%4s);\n", join(', ', @list), join(', ', @mvls));
  return(@mvls); }
if    (@*ARGS) {
  NCli(@*ARGS);
} else {
  NCli(2, 3, -1); # => (2, 3);
  NCli(3, 2, -4); # => (-4);
  NCli(1,    -1); # => ();
}
