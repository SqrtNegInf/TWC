#!/usr/bin/env perl
use v5.36;

my $objective = 200;
my @aMoves =();

while ($objective > 1 ) {
	if ($objective % 2 == 0){
		push (@aMoves, 'double');
		$objective = $objective / 2;
	} else {
		push (@aMoves, 'add 1');
		$objective = $objective - 1;
	}
}
my $amountMoney = 1;
foreach my $move (reverse(@aMoves)){
	if ($move eq 'double'){
		print "Double $amountMoney ";
		$amountMoney = $amountMoney * 2 ;
		print "= $amountMoney\n";
	} else {
		print "Add 1 to $amountMoney ";
		$amountMoney = $amountMoney + 1 ;
		print "= $amountMoney\n";
	}
}
