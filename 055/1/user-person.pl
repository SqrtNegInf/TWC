#!/usr/bin/env perl
use v5.36;

my $originalString = "010";

if (@ARGV) {
    $originalString = "$ARGV[0]";
    if ( $originalString =~ m{[^01]} ) {
        print STDERR "Arguments can only contain 1s and 0s.\n";
        exit(1);
    }
} else {
    #print STDERR "No arguments given. Using example data: 010\n";
}

my $n = length $originalString;

my $lowerBound = 0;
my $upperBound = $n;

my $max = 0;
my @maxes = ();

my $hasZeroes = 0;
if ($originalString =~ m{0} ) {
    $hasZeroes = 1;
}

if ( $originalString =~ m{\A(1+)} and $hasZeroes) {
    $lowerBound = length $1;
}

if ( $originalString =~ m{(1+)\Z} and $hasZeroes) {
    my $difference = length $1;
    $upperBound = $n - $difference;
}

for (my $left = $lowerBound; $left <= $upperBound; ++$left) {
    for (my $right = $left+1; $right <= $upperBound; ++$right) {

        my $binaryString = $originalString;
        my $offset = $right - $left;

        my $replace = substr $binaryString, $left, $offset;
        $replace =~ tr{01}{10};
        substr $binaryString, $left, $offset, $replace;

        my $num = () = $binaryString =~ m{1}g;

        if ($num > $max) {
            $max = $num;
            @maxes = ();
            push @maxes, sprintf("(L=%d, R=%d)", $left, $right-1);
        } elsif ($num == $max) {
            push @maxes, sprintf("(L=%d, R=%d)", $left, $right-1);
        }
    }
}

print "$_ " foreach @maxes;
print "\n";
