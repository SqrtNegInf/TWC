#!/usr/bin/env perl
use v5.36;

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
