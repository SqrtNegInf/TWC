#!/usr/bin/env raku

my @arr = ((4, 5, 1, 6), (1, 2, 3, 4),(1, 3, 4 ,5), (5, 1, 2, 3), (7, 2, 4, 5));
my $ks  =  (2,2,3,4,4) ;
my $cnt = 0;

my @out = ();

for (@arr) -> $ref {
  print "Input: \@list = \($ref\), k = $ks[$cnt]\n" ;
  for ($ref.permutations) -> $pr {
      my $i = $pr[0];
      my $j = $pr[1];
      my $k = $ks[$cnt];
      my $sz = $ref.elems;
      if ( ($i < $j) && (($i + $j) % $k == 0)  )  {
        @out.push: "$i$j$k$sz";
      }
  }

  print "Output: ";
  say @out.unique.elems;
  say " ";
  @out = ();
  $cnt++;
}
