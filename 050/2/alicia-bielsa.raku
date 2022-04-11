#!/usr/bin/env raku

my @aListIntegers = (19,11,9,7,20,3,17,16,2,14,1);

#for (0..10.rand.Int+3) {
#    my $number = 20.rand.Int+1;
#    @aListIntegers.push($number);
#}

my @aNobleIntegers = findNobleIntegers(@aListIntegers);
say "List: " ~ join(',', @aListIntegers) ;
say "Noble Integers: " ~ join(',', @aNobleIntegers);


sub findNobleIntegers(@aIntegers) {
    my @aNoble = ();
    for @aIntegers {
       my $countGreater = countTotalGreater(@aIntegers,$_);
       if $_ == $countGreater {
            @aNoble.push( $_) ;
       } 
    }
    return @aNoble ;
}

sub countTotalGreater(@aIntegers, $integer) {
   my $countGreater = 0;
   for @aIntegers {
        if  $_ > $integer {
            $countGreater++;
        }        
   }
    return $countGreater;
}
