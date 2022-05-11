#!/usr/bin/env raku

sub createRow( @array ) {
  my @output ;
  my $len = @array.elems ;
  for (1 .. $len - 1 ) -> $current {
      @output.push( @array[1 .. $current].sum ) ;
  }
  return @output ;
}

my $row = '1 5 4 3 2 6 7';
my @numbers = $row.split( /\s/ ).map( {.Int} ) ;
my @outputRow = @numbers ;
repeat {
  @outputRow = createRow( @outputRow ) ;
} until ( @outputRow.elems == 1 ) ;
say @outputRow[0] ;
