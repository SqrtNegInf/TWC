#!/usr/bin/env perl
use v5.36;

my @input  = scalar @ARGV   ? @ARGV 
                            : (1, 9, 5, 2, 6, 8, 9, 10, 2, 5, 1);

my @output;

normalize(\@input, \@output);

say "input:  @input";
say "output: @output";

## ## ## ## ## SUBS:

sub normalize {
## starting from the smallest value, if the given index value is
## larger than either of its neighbors, then it is
## revalued in the output to be the larger of its neighbors' output plus one. If it is
## smaller than both it is 1.
    my ($in, $out) = @_;

    my @order = sort { $in->[$a] <=> $in->[$b] } keys $in->@*;  
    for my $i (@order) {
        my $min = 1;
        for (1,-1) {
            next if ( $i + $_ < 0 or not defined $in->[$i+$_]) ;
            if ($in->[$i] > $in->[$i+$_]) {
                $min = max($out->[$i+$_] + 1, $min);
            }
        }
        $out->[$i] = $min;    
    }
}

sub max {
    my $max = "-inf";
    for (@_) {
        $max = $_ if $max < $_;
    }
    return $max;
}
