#!/usr/bin/env perl
use v5.36;

foreach my $i (0..50){
	if (isNiven($i)){
		print "$i\n";		
	}	
}

 
 sub isNiven {
 	my $number = shift;

    my $sumDigits = 0;
    my @aDigits = split('', $number);
    foreach my $digit (@aDigits){
        $sumDigits +=  $digit;      
    }	
 	if ($sumDigits == 0){
 		return 0; 		
  	}
 	
 	if ($number % $sumDigits == 0){   
 		return 1;
 	}
 	return 0;
 }
