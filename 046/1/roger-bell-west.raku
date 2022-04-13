#!/usr/bin/env raku

my @place;

my $message =
'P + 2 l ! a t o
1 e 8 0 R $ 4 u
5 - r ] + a > /
P x w l b 3 k \
2 e 3 5 R 8 y u
< ! r ^ ( ) k 0';

for $message.lines() {
  .chomp;
  my @k=comb(/\S/,$_);
  map {@place[$_]{@k[$_]}++}, (0..@k.end);
}

for @place -> %h {
  my @v=values %h;
  my @k=keys %h;
  my @i=sort {@v[$^b] <=> @v[$^a]}, (0..@v.end);
  print @k[@i[0]];
}
print "\n";
