#!/usr/bin/env raku

sub JmpL {my @jump = @_;my @word = split('', shift(@jump), :skip-empty);my $jmpw = '';my @letz = ('a'..'z');my %lnlu = (); # LetteriNdexLookUp
  for (0..@letz.elems - 1) { %lnlu{@letz[$_]} = $_; }
  for (0..@word.elems - 1) { my $letr = lc(@word[$_]);my $lucf = 0;$lucf = 1 if (@word[$_] eq uc(@word[$_])); # LetterUpperCaseFlag
    $letr = @letz[(%lnlu{$letr} + @jump[$_]) % @letz.elems];$letr = uc($letr) if ($lucf);$jmpw ~= $letr; }
  say "word:'" ~  join('', @word) ~ "' jump:(" ~ join(',', @jump) ~ ") => '$jmpw';";
  return($jmpw);
}
if    (@*ARGS) {
  JmpL(@*ARGS);
} else {
  JmpL('Perl', 2, 22, 19, 9); # => Raku;
  JmpL('Raku', 24, 4, 7, 17); # => Perl;
}
