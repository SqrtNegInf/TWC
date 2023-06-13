#!/usr/bin/env perl
use v5.36;

my $totalGapfulNumbers = 20;
my $totalGapfulNumbersFound = 0;
my $currentNumber = 100;
while ($totalGapfulNumbersFound < $totalGapfulNumbers ){
    my ($firstDigit, $lastDigit ) = (split('',$currentNumber))[0, length($currentNumber)-1];
    my $firstLastNumber = $firstDigit.$lastDigit;
    if ($currentNumber % $firstLastNumber   == 0){
        print "Gapful number found: $currentNumber\n";
        $totalGapfulNumbersFound++;        
    }
    $currentNumber++;
}
