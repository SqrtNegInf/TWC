#!/usr/bin/env raku
my $lucky;
my @matrix  = ([3, 7, 8], [9, 11, 13], [15, 16, 17]);
my @rowminima ;
my @colmaxima ;
my @columns ;
my $rownumber = @matrix.elems ;
my $colnumber = @matrix[0].elems ;
for (0..$colnumber - 1 ) -> $c {
   my @column ;
   for (0..$rownumber - 1 ) -> $r {
      @column.push( @matrix[$r][$c] ) ;
   }
   @columns.push( @column ) ;
}
for @matrix -> @row {
   @rowminima.push( @row.min ) ;
}
for @columns -> @column {
   @colmaxima.push( @column.max ) ;
}
my $common = @rowminima.Set (&) @colmaxima.Set ;
if $common.elems > 0 {
   $lucky = $common.keys ;
}
say $lucky ;
	    
