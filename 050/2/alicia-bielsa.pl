#!/usr/bin/env perl
use v5.36;

my @aListIntegers = (19,11,9,7,20,3,17,16,2,14,1);
my @aNobleIntegers = findNobleIntegers(@aListIntegers);

print "List: ".join(',', @aListIntegers)."\n";
print "Noble Integers: ".join(',', @aNobleIntegers)."\n";

sub findNobleIntegers {
    my @aIntegers = @_;
    my @aNoble = ();
    foreach my $integer (@aIntegers){
       my $countGreater = 0;
       foreach my $integerToCompare (@aIntegers){
            if ( $integerToCompare > $integer ){
                $countGreater++;
            }        
       }
       if ($integer == $countGreater){
            push (@aNoble , $integer) ;
       } 
    }
    return @aNoble ;
}
