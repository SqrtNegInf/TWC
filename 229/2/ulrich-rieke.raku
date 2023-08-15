#!/usr/bin/env raku

my $line = '4';
my $set1 = set( $line.words.map( {.Int} )) ;
$line = '2 4';
my $set2 = set( $line.words.map( {.Int} ) ) ;
$line = '1 2 4';
my $set3 = set( $line.words.map( {.Int} ) ) ;
my $first_intersect = $set1 (&) $set2 ;
my $second_intersect = $set2 (&) $set3 ;
my $third_intersect = $set1 (&) $set3 ;
my $union = $first_intersect (|) $second_intersect ;
$union = $union (|) $third_intersect ;
say $union.keys.sort ;
