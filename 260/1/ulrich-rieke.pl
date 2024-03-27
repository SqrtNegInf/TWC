#!/usr/bin/env perl
use v5.36;

my $line = '1 2 2 1 1 3';
my %uniques ;
my %frequencies ;
my @numbers = split( /\s+/ , $line ) ;
for my $num ( @numbers ) {
   $uniques{ $num }++ ;
}
for my $num ( keys %uniques ) {
   $frequencies{ scalar( grep { $_ eq $num } @numbers ) }++ ;
}
if ( scalar( keys %frequencies ) == scalar( keys %uniques ) ) {
   say 1 ;
}
else {
   say 0 ;
}
