#!/usr/bin/env perl
use v5.36;

# 'die' to exit, really?

my %q = map { $_=>$_ } (my @p = (0,1));
for(my $o=2;;$o++) {
  for(my $i=1, ($q{$p[$o]||=$o*(3*$o-1)/2}||=$o); $i<$o; $i++) {
    (my $t=$q{$p[$o]-$p[$i]}) || next;
    (push(@p, @p * (3*@p-1)/2), $q{$p[-1]}=@p) while $p[$o]+$p[$i] > $p[-1];
    (my $s=$q{$p[$o]+$p[$i]}) || next;
    say "First 2 pents are:\n  p($o) = $p[$o]\n  p($i) = $p[$i],\n  p($o) + p($i) = $p[$s] = p($s),\n  p($o) - p($i) = $p[$t] = p($t).\n" and exit;
  }
}

