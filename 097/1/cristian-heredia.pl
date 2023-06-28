#!/usr/bin/env perl
use v5.36;

my $input = "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG";
my $N = 3;

my @plain = ("A" .. "Z");
my @sentence = split(//, $input);
my $counter = $N;

my %hash;
my $i;
my $output = "";

cipher();
sub cipher {
    foreach ($i = 0; $i < (26 - $N); $i++) {
        $hash{$plain[$counter]} = $plain[$i];
        $counter++;
    }
    
    foreach (my $j = 0; $j < $N; $j++) {
            $hash{$plain[$j]} = $plain[$i];
            $i++;
    }
    encrypt();
}

sub encrypt {
    foreach (my $k = 0; $k < @sentence; $k++) {
        if ($sentence[$k] eq " ") {
            $output = $output." ";
        }
        else {
            $output = $output.$hash{$sentence[$k]};
        }
    }
    print "$output\n";
}
