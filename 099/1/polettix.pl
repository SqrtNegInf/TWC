#!/usr/bin/env perl
use v5.36;

sub pattern_match ($S, $T) {
   $T = join '',
      map { $_ eq '*' ? '.*' : $_ eq '?' ? '.' : quotemeta($_) }
      split m{([*?])}mxs, $T;
   return $S =~ m{\A$T\z}mxs ? 1 : 0;
}

my $string = shift // 'abcde';
my $pattern = shift // 'a*e';
say pattern_match($string, $pattern);
