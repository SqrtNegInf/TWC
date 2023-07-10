#!/usr/bin/env raku

my $source = "scriptinglanguage";
my $target = "pearl";
my %sourceHash ;
my %targetHash ;
my @targetletters = $target.comb ;
my @sourceletters = $source.comb ;
@targetletters.map( {%targetHash{$_}++} ) ;
@sourceletters.map( { %sourceHash{$_}++ } ) ;
my @selected = @targetletters.grep( {%sourceHash{$_}:exists &&
      %sourceHash{$_} >= %targetHash{$_} } ) ;
if ( @selected.elems == @targetletters.elems ) {
  say "true" ;
}
else {
  say "false" ;
}
