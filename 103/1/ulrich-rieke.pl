#!/usr/bin/env perl
use v5.36;

my $year = 2022 ;
my @animalsuccession = ("Rat" , "Ox" , "Tiger" , "Rabbit" , "Dragon" , "Snake" ,
      "Horse" , "Goat" , "Monkey" , "Rooster", "Dog" , "Pig" ) ;
my @elements = ("Wood" , "Fire" , "Earth" , "Metal" , "Water" ) ;
my $animallen = scalar @animalsuccession ;
my $elementlen = scalar @elements ;
my $yeardiff = $year - 1924 ;
my $animal = $yeardiff % $animallen ;
my $element = (int( $yeardiff / 2 )) % $elementlen ;
say "$elements[ $element ] $animalsuccession[ $animal ]" ;
