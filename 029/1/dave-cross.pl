#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';


say $_ for brace_expand('Perl {Daily,Weekly,Monthly,Yearly} Challenge');

sub brace_expand {
  my ($string) = @_;

  my $braced;
  unless (($braced) = $string =~ /\{(.+?)}/) {
    return $string;
  }

  return map { $string =~ s/\{.+?}/$_/r; } split /,/, $braced;
}
