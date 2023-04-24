#!/usr/bin/env raku

sub FunS {my @list = @_;my @even = ();my @odds = ();my @funs;
  for   (sort +*, @list) {
    if  ($_ % 2) { push(@odds, $_); }
    else         { push(@even, $_); } }
  @funs = (|@even, |@odds);
  printf("(%-11s) => (%-11s);\n", join(',', @list), join(',', @funs));
  return(@funs);
}
if    (@*ARGS) {
  FunS(@*ARGS);
} else {
  FunS(1,2,3,4,5,6); # => (2,4,6,1,3,5);
  FunS(1,2        ); # => (2,1);
  FunS(1          ); # => (1);
}
