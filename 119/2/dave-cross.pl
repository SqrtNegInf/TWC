#!/usr/bin/env perl
use v5.36;

my $n = 60;

my @seq;

while (@seq < $n) {
  get_next(\@seq);
}

say $seq[-1];

sub get_next {
  my ($seq) = @_;

  unless (@$seq) {
    @$seq = 1;
    return;
  }

  my $next = $seq->[-1] + 1;

  until ($next =~ /^[123]+$/ and $next !~ /11/) {
    ++$next;
  }
  
  push @$seq, $next;

  return;
}
