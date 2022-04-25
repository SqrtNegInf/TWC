#!/usr/bin/env perl

use strict;
use warnings;

# "Generate a longest sequence of the following English Pokeman names where each name starts with the last letter of previous name."
# I assume without reuse of a name, otherwise it's trivially (exeggcute) × ∞
# and for simplicity I keep only the first longest sequence, not all of them

use Storable qw(dclone);

my $table;
while (<DATA>) {
  chomp;
  $_ =~ /^(.).*?(.)$/;
  $table->{$1}{$2}{$_}=1;
}

print join(' ',search($table,'')),"\n";

sub search {
  my $tab=shift;
  my $init=shift;
  my $m=0;
  my @out;
  my @initial;
  if (defined $init && $init) {
    @initial=($init);
  } else {
    @initial=sort keys %{$tab};
  }
  foreach my $initial (@initial) {
    foreach my $final (sort keys %{$tab->{$initial}}) {
      foreach my $candidate (sort keys %{$tab->{$initial}{$final}}) {
        my $tt=dclone($tab);
        delete $tt->{$initial}{$final}{$candidate};
        my @r=($candidate,search($tt,$final));
        my $l=scalar @r;
        if ($l > $m) {
          $m=$l;
          @out=@r;
        }
      }
    }
  }
  return @out;
}

__END__
audino
bagon
baltoy
banette
bidoof
braviary
bronzor
carracosta
charmeleon
cresselia
croagunk
darmanitan
deino
emboar
emolga
exeggcute
gabite
girafarig
