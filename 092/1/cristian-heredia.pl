#!/usr/bin/env perl
use v5.36;

my $A = "abc"; 
my $B = "xyz";
my %hash;
my @sets;
my $C1;
my $C2;

#Convert into arrays
my @arrayA = split(//, $A);
my @arrayB = split(//, $B);

foreach (my $i=0; $i<@arrayA; $i++) {
    $C1 = $arrayA[$i];
    $C2 = $arrayB[$i];
    checkHash();
}

print "Output: 1\n";

sub addIntoHash {
    $hash{$C1} = $C2;
}

sub checkHash {
    if(!exists $hash{$C1}) {
        if(grep $_ eq $C2, @sets) {
            print "Output: 0\n";
            exit;
        }
        else {
            push @sets, $C2;
            addIntoHash();
        }
    }
    elsif ($hash{$C1} eq $C2) {
        addIntoHash();
    }
    else {
        print "Output: 0\n";
        exit;
    }
}






