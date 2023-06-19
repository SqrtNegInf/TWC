#!/usr/bin/env raku

sub lettercount( $word ) {
  my %wordHash ;
  for $word.comb -> $letter {
      %wordHash{$letter}++ ;
  }
  return %wordHash ;
}

sub condition( $aWord, %compCount ) {
  my %wordHash = lettercount( $aWord ) ;
  for %wordHash.keys -> $k {
      if not ( %compCount{$k}:exists && %compCount{ $k } >=
        %wordHash{ $k } ) {
    return False ;
      }
  }
  return True ;
}

my @words = ("cat", "bt", "hat", "tree");
my $comparator = "atach";
my %compHash ;
for $comparator.comb -> $letter {
  %compHash{$letter}++ ;
}
my @selected = @words.grep( {condition( $_ , %compHash )} ) ;
if ( @selected ) {
  my @lengths = @selected.map( {$_.chars} ) ;
  say [+] @lengths ;
}
else {
  say 0 ;
}
