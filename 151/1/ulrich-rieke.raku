#!/usr/bin/env raku

#say "Enter binary tree, denoting every new level with a |" ;
my $tree = '1 | 2 3 | 4 * * 5 | * 6'; #$*IN.get ;
my $mindepth = 0 ;
my $len = $tree.chars ;
for (0 .. $len - 1 ) -> $i {
  if ( $tree.substr( $i , 1 ) eq '|' ) {
      $mindepth++ ;
  }
}
say $mindepth ;
