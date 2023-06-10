#!/usr/bin/env perl
use v5.36;

# Heights
my @H = (27, 21, 37,  4, 19, 52, 23, 64,  1,  7, 51, 17, 24, 50,  3,  2,
      34, 40, 47, 20,  8, 56, 14, 16, 42, 38, 62, 53, 31, 41, 55, 59,
      48, 12, 32, 61,  9, 60, 46, 26, 58, 25, 15, 36, 11, 44, 63, 28,
       5, 54, 10, 49, 57, 30, 29, 22, 35, 39, 45, 43, 18,  6, 13, 33);

# Number taller people in front
my @T = ( 6, 41,  1, 49, 38, 12,  1,  0, 58, 47,  4, 17, 26,  1, 61, 12,
      29,  3,  4, 11, 45,  1, 32,  5,  9, 19,  1,  4, 28, 12,  2,  2,
      13, 18, 19,  3,  4,  1, 10, 16,  4,  3, 29,  5, 49,  1,  1, 24,
       2,  1, 38,  7,  7, 14, 35, 25,  0,  5,  4, 19, 10, 13,  4, 12);

my @arranged=();            # the array to be built

# the main algorithm follows, reduced to one statement containing three steps

      # Step 3 insert into array, indexing at [people in front] position 
splice (@arranged,$$_{tallerInFront},0,$_)
      # Step 2 sort that list by height
   foreach (sort {$$b{height} <=> $$a{height} }  
      # Step 1  create List pairing the height and taller-in-front data                    
         map{ {height=>$H[$_],tallerInFront=>$T[$_] } } (0..$#H)  );   

## validity test...goes through each person in the list and tests that 
## the number of people taller that him/her in front matches that required

my $errors="";                           # to pass strict
foreach my $position (0..$#arranged){
  my $count=0;                           # reset counter
  foreach (0..$position-1){              # check all people until that position
     $count++ if $arranged[$_]->{height}>$arranged[$position]->{height}		
  }                                      # add to $count
  # check that $count matches expected, otherwise report position an error                                       
  if ($arranged[$position]->{tallerInFront}!=$count) {
    $errors.="**The result fails validity test: person of height $arranged[$position]->{height}".
             "  should have $arranged[$position]->{tallerInFront} in front but has $count\n";
    last;         # comment this line out to get all errors
  }
}

# display result or error message if there is an error
print $errors?$errors:"One possible answer may be \n(".
       (join ", ", map {$$_{height} } @arranged).")\n";

