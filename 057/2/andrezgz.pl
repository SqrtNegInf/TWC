#!/usr/bin/env perl
use v5.36;

my $input = [ "alphabet", "book", "carpet", "cadmium", "cadeau", "alpine" ];
my $l = @$input -1;

my @output;

for my $i (0 .. $l){
    for my $j (1 .. length $input->[$i]){
        my $s = substr $input->[$i],0,$j;
        next if grep { $s eq substr $_,0,$j }
                ( @$input[0 .. $i-1] , @$input[$i+1 .. $l] );
        push @output,$s;
        last;
    }
    push @output,'N/A' if @output != $i+1; #not unique prefix
}

print join ',', @output;

