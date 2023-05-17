#!/usr/bin/env perl
use v5.36;

use Test::More;

print join ' ', semiprimes(100); print "\n";
print join ' ', sp_loop(100); print "\n";
print join ' ', sp_map(100); print "\n";

sub sp_loop {
  my $N = shift;
  my @p; my %ph;
  my @sp;
  foreach my $t ( 2..$N ) {
    my $prime = 1;
    foreach(@p) {
      next if $t%$_;
      $prime = 0;
      (push @sp,$t) && (last) if exists $ph{$t/$_};
    }
    if( $prime ) {
      push @p,$t; $ph{$t}=1;
    }
  }
  @sp;
}

sub sp_map {
  my $N = shift;
  my @primes      = (2);
  my @semi_primes = (4);

  foreach my $p ( map { 1+2*$_ } 1..($N/4) ) {
    map { ($p%$_)||(next) } @primes;
    push @primes,$p;
    push @semi_primes,grep {$_<=$N} map{$p*$_} @primes;
  }
  sort {$a<=>$b} @semi_primes;
}

sub semiprimes {
  my $N = shift;
  my @primes      = (2);
  my @semi_primes = (4);

  foreach my $p ( map { 1+2*$_ } 1..($N/4) ) {
    map { ($p%$_)||(next) } @primes;
    push @primes,$p;
    ($p*$_>$N) ? (next) : (push @semi_primes,$p*$_) for @primes;
  }
  sort {$a<=>$b} @semi_primes;
}

