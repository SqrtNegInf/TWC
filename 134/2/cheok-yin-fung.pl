#!/usr/bin/env perl
use v5.36;

my $m = $ARGV[0] || 5;
my $n = $ARGV[1] || 5;
my $lw = $ARGV[2] || 256;

my %hash;

my $ref_prod = length $m*$n;
my $ref_m = length $m;
my $ref_long = $ref_m + 2 + $n * ( 1 + $ref_prod );
die "The value of \$m*\$n is too large for linewidth $lw\n" 
    if $ref_long > $lw;

print " " x ($ref_m - 1), "x", " |";
printf "%*d", $ref_prod+1, $_ for (1..$n);
print "\n";
print "-" x ($ref_m+1), "+", "-" x ($ref_long-$ref_m-2);
print "\n";
for my $i (1..$m) {
    printf "%*d |", $ref_m, $i;
    for my $j (1..$n) {
        printf "%*d", 1+$ref_prod, $i*$j;
        $hash{$i*$j} = 1;
    }
    print "\n";
}

print "Distinct Terms:\n";
print join ", ", sort {$a<=>$b} keys %hash;
print "\n";
print "Count: ", scalar keys %hash;
print "\n";
