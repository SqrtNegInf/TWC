#!/usr/bin/env raku

my @array = <9 10 7 5 6 1>;
my @leaders ;
my $len = @array.elems ;
for (0..$len - 2 ) -> $i {
  if ( @array[ $i ] > max( @array[ $i + 1 ..$len - 1] ) ) {
      @leaders.push( @array[ $i ] ) ;
  }
}
@leaders.push( @array[ *-1]) ;
say @leaders ;
