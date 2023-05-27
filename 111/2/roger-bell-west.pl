#!/usr/bin/env perl
use v5.36;

my $ml=0;
my @r;
while (<DATA>) {
  chomp;
  my $l=length($_);
  if ($l >= $ml) {
    if (join('',sort split '',$_) eq $_) {
      if ($l > $ml) {
        @r=();
        $ml=$l;
      }
      push @r,$_;
    }
  }
}

print map{"$_\n"} @r;

__END__
abc
bash
demi
lawn
slud
tamp
wakf
Bibio
arjun
inken
pleny
stylo
swelp
topsl
visne
wifie
ampere
bloomy
deafen
depart
dumple
feeder
gleyde
huspil
titled
waning
billow
billowy
bugloss
caloyer
choragy
confute
corning
fugally
hyphema
