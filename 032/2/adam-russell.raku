#!/usr/bin/env raku

sub term:<MAX-LENGTH> { 10 }; 

#sub MAIN() {
    my %data := { apple => 3, cherry => 2, banana => 1 }; #from-json $input; 
    my @sorted = %data.sort(*.value);
    my $min = @sorted[0].value;
    my $max = @sorted[@sorted.end].value;
    for %data.sort(*.value).reverse -> $pair {
        print $pair.key ~ "\t| "; 
        say "#" x ($pair.value - $min + 1) / ($max  - $min) * MAX-LENGTH;
    }  
#} 
