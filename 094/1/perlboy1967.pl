#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

while (<DATA>) {
  chomp();
  my @words = map { s/\s*(\S+)\s*/$1/; $_ } split(/,/);

  my %anagrams;

  foreach my $word (@words) {
    my $k = join('',sort split //, $word);
    push(@{$anagrams{$k}}, $word);
  }

  printf "-------------------------------------------\n";
  printf "Input: (%s)\n", join('"),("', @words);
  printf "Output:\n";
  printf "\t%s\n", join("\n\t", 
                        map { 
                          join(',', sort @{$anagrams{$_}})
                        } sort keys %anagrams);
  printf "-------------------------------------------\n";
}

__DATA__
opt,bat,saw,tab,pot,top,was
x
stet,tips,test,pits,bal,spit,lab
