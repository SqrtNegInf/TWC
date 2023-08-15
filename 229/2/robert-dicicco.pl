#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use List::MoreUtils qw(uniq);

#my @arrays = ([1, 1, 2, 4,],[2, 4],[4]);
my @arrays = ([4, 1],[2, 4],[1, 2]);

my %hash = ();
my $cnt = 1;
my (@array1,@array2,@array3) = ();

sub CreateCounts {
    for my $i (@_) {
        if (exists ($hash{$i})) {
            $hash{$i}++;
        } else {
            $hash{$i} = 1;
        }
    }
}

for my $a (@arrays) {
    my @a_uniq = uniq @$a;
    if ($cnt == 1) {
        @array1 = @a_uniq;
        CreateCounts(@array1);
        say "Input:  \@array1 = (@array1)";
    } elsif ($cnt == 2) {
        @array2 = @a_uniq;
        CreateCounts(@array2);
        say "\t\@array2 = (@array2)";
    } elsif ($cnt == 3) {
        @array3 = @a_uniq;
        CreateCounts(@array3);
        say "\t\@array3 = (@array3)";
    } else {
        print("ERROR!");
        exit;
    }
    $cnt++;
}

print("Output: ( ");
for my $key (keys %hash) {
    if ($hash{$key} >= 2 ){
        print("$key ");
    }
}

print(" \)");
