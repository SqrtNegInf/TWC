#!/usr/bin/env perl
use v5.36;

my $dictFile = 'dictionary.txt';

open(my $fhDict, '<', $dictFile) ||
  die "Can't open dictfile '$dictFile' ($!)";

my %w;
while (<$fhDict>) {
  chomp;
  if ($_ eq join '',sort split //) {
    push(@{$w{length $_}},$_);
  }
}
close($fhDict);

say join("\n",map {join("\n", reverse sort @{$w{$_}})} sort {$b<=>$a} keys %w); 

__END__
Abecedarian quote for Colin: A hot dirty messy hippy chills at empty glossy films
