#!/usr/bin/env perl
use v5.36;

# we generate some strings with a character of our choice to draw a diamond
my @aStrings =();
my $character = '*';
my $count = 2;
while  ($count <= 20){
	push (@aStrings, $character x $count);
	$count += 2;
}
while  ($count >= 2){
	 push (@aStrings, $character x $count);
	 $count -= 2;
}



my @aLinesCentered = center(@aStrings);


foreach my $line (@aLinesCentered){
	print "$line\n";
}


sub center {
	my @aLinesToCenter = @_;

	my @aLinesCentered = ();
	
	my $maxLength =  length((sort {length($b) <=> length ($a)} @aLinesToCenter)[0]);	
	
	foreach my $lineToCenter (@aLinesToCenter){
		push (@aLinesCentered, (' ' x ( abs ( length($lineToCenter)/2 - $maxLength /2 ))).$lineToCenter);
	}
	
	return @aLinesCentered;
}
