#!/usr/bin/env perl
use v5.36;

my($A,$B) = (100, 500);

# Get all common divisors.
my %divisors_of_A = divisors($A);
my %divisors_of_B = divisors($B);
my @common_divisors;
foreach my $num (sort { $a <=> $b } keys %divisors_of_A) {
    push @common_divisors, $num
        if exists $divisors_of_B{$num};
}

# Returns all divisors of a number.
sub divisors {
    my $n = shift @_;
    my %divisors;
    foreach my $i ( 1 ... $n){
        if ($n % $i == 0) {
            $divisors{$i} = 1;
        }
    }
    return %divisors;
}

print join(', ', @common_divisors), "\n";
