#!/usr/bin/env perl
use v5.36;

my $doorCount=500;

my @doors=(0)x($doorCount+1);          # $doorCount+1 doors

foreach my $doorman (1..$#doors) {     # each of the employees
    my $n=1;                           # multiples starting with one
    while ($doorman*$n<=($doorCount)){ # and continuing until no more doors
	                                   # toggles the door state (using 'not')
      $doors[$doorman*$n++]=not $doors[$doorman*$n]; 
    }
}

# print each open door;
foreach my $door (1..$#doors){
	print " ".$door if $doors[$door];  
}

print "\n";
# The results are interesting. The door will only stay open if it has an
# odd number of factors. Factors of a number generally occur as pairs
# that multiply together to produce that number...so the only way to get a 
# odd number of factors is when it possible for both the factors to be
# the same...i.e the number has to be a square number.
# the same results can therefore be obtained by: 

my $cheat=1;
print " ".($cheat++)**2 while $cheat<sqrt($doorCount);
