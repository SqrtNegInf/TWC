#!/usr/bin/env perl
use v5.36;

use List::Util qw ( all ) ;

my $source = "scriptinglanguage";
my $target = "pearl";
chomp $target ;
my %sourceHash ;
my %targetHash ;
map { $sourceHash{$_}++ } split ( // , $source ) ;
map { $targetHash{$_}++ } split ( // , $target ) ;
if ( all { (exists( $sourceHash{$_} )) && ( $sourceHash{$_} >=
    $targetHash{$_} ) } keys %targetHash ) {
  say "true" ;
}
else {
  say "false" ;
}
