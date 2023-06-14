#!/usr/bin/env perl
use v5.36;

# hash containing known Leornado numbers.  It is prepopulated with 
# L(0) and L(1), but more added as discovered by L().
my %leonardos=(0=>1,1=>1,); 

# Golden ratio numbers required for the closedForm() method
my $gr1=(1+sqrt(5))/2;
my $gr2=(1-sqrt(5))/2;


say  "$_) ", L($_) 	for (0..20);  # find the first 21 leonardo numbers


# This subroutines uses no caching and rapidly slowss after about 
# 25 retrievals. 
sub l{
  my $ln=shift;
  return $ln < 2?1:l($ln-2)+l($ln-1)+1;
}

#  This retrieves Leonardo numbers from cache where needed
sub L{
  my $ln=shift;	
  
  # find and store L(N) in the hash, if it does not exist already
  unless (exists  $leonardos{$ln}) {                      
	  $leonardos{$ln}=L($ln-2)+L($ln-1)+1
  };
   #return stored L(N)
  return $leonardos{$ln};
}

# This is a closed form function that requires no recursion
# see https://en.wikipedia.org/wiki/Leonardo_number
sub closedForm{
	my $ln=shift;
	return 2*($gr1**($ln+1)-$gr2**($ln+1))/($gr1-$gr2) -1;
}
