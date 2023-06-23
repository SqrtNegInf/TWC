#!/usr/bin/env perl
use v5.36;

my @aPrimeNumbers = getPrimeNumbers(6);  # 5th is not perfect

foreach my $primeNumber (@aPrimeNumbers){
	print 2 ** ($primeNumber -1) * ( 2 ** $primeNumber -1 )."\n";	
}


sub getPrimeNumbers {
	my $totalNumbers = shift;
	my @aPrimes = ();
	my $limit = 1000;
	foreach my $number ( 2..$limit ){
	    my $isPrime = 1;
		foreach my $i ( 2..$number-1){
			if ($number  % $i == 0 ){
				$isPrime = 0;
			}
		}
		if ( $isPrime ){
			push ( @aPrimes , $number );
		}
		last if (scalar(@aPrimes) == $totalNumbers);	
	}
	return @aPrimes;
}
