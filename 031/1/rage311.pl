#!/usr/bin/env perl
use v5.36;

sub divide ($num, $denom) {
  my $result = eval { $num / $denom };
  warn "($num / $denom) $@" and return undef if
    $@ && index($@, 'Illegal division by zero') > -1;
  return $result;
}

sub print_div ($num, $denom) {
  my $result = divide $num, $denom;
  say "$num / $denom = ", ($result // 'ERROR');
}

my @tests = (
  [ 5, 2 ],
  [ 1, 0 ],
  [ 99, 999999 ],
  [ -1.5, 2 ],
  [ -2, -99999 ],
  [ 0, 19.991 ],
  [ 0.123, 0 ],
  [ 9999999999, 0 ],
  [ 256, 8 ],
);

print_div @$_ for @tests;
