#!/usr/bin/env raku

sub mergeArrays( @firstArray, @secondArray ) {
  my @merged ;
  for (0..@firstArray.elems + @secondArray.elems - 1 ) {
      if ( @firstArray ) {
    @merged.push( @firstArray.shift ) ;
      }
      if ( @secondArray ) {
    @merged.push( @secondArray.shift ) ;
      }
  }
  return @merged ;
}

my @array = ^6;
my @original = @array ;
my $len = @array.elems ;
my $half = $len div 2 ;
my @firstHalf = @array[0..$half - 1] ;
my @secondHalf = @array[$half..$len - 1] ;
my @reversed = @secondHalf.reverse ;
my @reordered = mergeArrays( @firstHalf, @reversed ) ;
say "The original list:" ;
@original.join("->").say ;
say "reordered:" ;
@reordered.join( "->").say ;
