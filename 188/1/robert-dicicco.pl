#!/usr/bin/env perl
use v5.36;
use Algorithm::Permute;
use List::Util qw/uniq/;

my @n = ([4, 5, 1, 6], [1, 2, 3, 4],[1, 3, 4 ,5], [5, 1, 2, 3], [7, 2, 4, 5]);
my @ks = (2,2,3,4,4);

my $cnt = 0;
my @out;

foreach my $nd (@n) {
  say "Input: \@list = \[@$nd\], \$k = $ks[$cnt]" ;
  my $p = Algorithm::Permute->new([@{$nd}], $ks[$cnt]);
  while ( my @res = $p->next) {
    my $i = $res[0];
    my $j = $res[1];
    my $k = $ks[$cnt];
    my $sz = scalar $n[$cnt];
    if ( ($i < $j) and (($i + $j) % $k == 0)  ){
      my $val ="$i$j";
      push(@out,$val);
    }
  }
  @out=sort(@out);
  @out = uniq(@out);
  print "Output: "; say scalar @out;
    @out = ();
  say " ";
  $cnt++;
}
