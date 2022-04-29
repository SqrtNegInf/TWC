#!/usr/bin/env raku

sub MAIN ( @strings = <zabc xabcy abcd> ) {
  @strings.map( { m:ex/.+/>>.Str } ).reduce( { $^a ∩ $^b } ).keys.max(*.chars).say
}
