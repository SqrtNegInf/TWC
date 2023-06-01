#!/usr/bin/env perl
use v5.36;

sub dna_sequence ($s) {
   my $complementary = $s =~ tr{ACGT}{TGCA}r;
   my %cf = map { $_ => eval "scalar \$s =~ tr{$_}{}d" } qw< A C G T >;
   return (\%cf, $complementary);
}

my $default =
  'GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG';
my $sequence = shift || $default;
my ($cf, $complementary) = dna_sequence($sequence);

$|++;
say {*STDOUT} $complementary;
say {*STDOUT} "A<$cf->{A}> C<$cf->{C}> G<$cf->{G}> T<$cf->{T}>";
