#!/usr/bin/env perl
use v5.36;


my @primes = primeNumbers();
my @result = semiprime();

# Print all the semiprimes numbers in a line, separated by ', '
print join(", ",@result);

# Function to obtain all the primes numbers <= 100
sub primeNumbers{
    foreach(my $i=2; $i<=100; $i++){
        push(@primes, $i);
        foreach(my $j=2; $j< $i; $j++){
            if ($i%$j == 0){
                pop(@primes);
                last;
            }
        }   
    }
    return @primes;
}

# Function to obtain all the semiprimes numbers <= 100
sub semiprime{
    foreach (my $l=2; $l<=100; $l++){
        foreach(my $m=0; $m<@primes; $m++){
            foreach(my $n=0; $n<@primes; $n++){
                if($l == ($primes[$m]*$primes[$n]) and not grep( /^$l$/, @result )){
                    push(@result, $l);
                }
            }
        }
    }
    return @result;
}
