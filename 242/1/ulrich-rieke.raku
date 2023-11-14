#!/usr/bin/env raku

my @firstNumbers = (1, 2, 3, 3);
my @secondNumbers = (1, 1, 2, 2);
my $firstSet = @firstNumbers.Set ;
my $secondSet = @secondNumbers.Set ;
my $firstDiff = $firstSet (-) $secondSet ;
my $secondDiff = $secondSet (-) $firstSet ;
print "((" ;
if ( $firstDiff ) {
   print $firstDiff.keys.sort ;
}
if ( $secondDiff ) {
   say ") , (" ~ $secondDiff.keys.sort ~ "))" ;
}
else {
   say "))" ;
}
