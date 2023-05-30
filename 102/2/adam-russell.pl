#!/usr/bin/env perl
use v5.36;

sub hash_counting_string{
    my($n) = @_;
    return "" if $n == 0; 
    return "#" if $n == 1; 
    my $h = "$n#";  
    return hash_counting_string($n - length($h)) . $h;  
}

MAIN:{
    print hash_counting_string(1). "\n";
    print hash_counting_string(2). "\n";
    print hash_counting_string(3). "\n";
    print hash_counting_string(10). "\n";
    print hash_counting_string(14). "\n";
}
