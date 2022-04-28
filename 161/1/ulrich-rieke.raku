#!/usr/bin/env raku

my $inputfile = "dictionary.txt" ;
my $fh = open $inputfile , :r ;
my @abecedearian ;
for $fh.lines -> $line {
  if $line.comb.sort.join eq $line {
      @abecedearian.push( $line ) ;
  }
}
close $fh ;
my @sorted = @abecedearian.sort( { $^b.chars <=> $^a.chars } ) ;
@sorted.join( ',' ).say ;
