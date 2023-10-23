#!/usr/bin/env raku

sub MAIN ($allowed = 'ab', @str = <ad bd aaab baa badab>) { put consistent-string($allowed, @str).elems }

sub consistent-string ($allowed, @str) {
   my $al = $allowed.comb.Set;
   my &checker = sub ($input) {
      for $input.comb -> $c {
         return False unless $c ∈ $al;
      }
      return True;
   };
   @str.grep(&checker);
}
