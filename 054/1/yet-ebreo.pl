#!/usr/bin/env perl
use v5.36;

my @r;
my $n = $ARGV[0] || 3;
my $k = $ARGV[1] || 4;

#Definitely not optimized, can only easily handle $n = 9, larger n should work too but would take some time 
sub generate {
    my ($A,$k) = @_;
    if ($k == 1) {
        push @r, join "", @{$A};
    } else {
        
        for my $i (0..$k-1) {
            generate(\@{$A},$k-1);
            
            if ($i <= $k ) {
                my $h = $A->[$k-1];
                my $j = $k % 2 ? 0: $i;
                
                #swap values
                ($A->[$j],$A->[$k-1]) = ($A->[$k-1],$A->[$j]);
            }
        }
    }
}

my @x = 1..$n;
generate(\@x,$n);
@r = sort @r;
say $r[$k-1];
