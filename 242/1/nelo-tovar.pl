#!/usr/bin/env perl
use v5.36;

use Data::Dump qw(dump);

my @examples = (
    [ [ 1, 2, 3 ], 
      [ 2, 4, 6 ], 
    ],
    [ [ 1, 2, 3, 3 ], 
      [ 1, 1, 2, 2 ], 
    ],
);

sub missing_members {
    my $a1 = shift;
    my $a2 = shift;

    my @missing1;
    my @missing2;

    
    no warnings;
    foreach my $element (@$a1) {
        next if ( $element ~~ @$a2);
        push @missing1, $element unless ($element ~~ @missing1);
    }

    foreach my $element (@$a2) {
        next if ( $element ~~ @$a1);
        push @missing2, $element unless ($element ~~ @missing2);
    }
    use warnings;

    return [[@missing1], [@missing2]];
}

for my $e (@examples) {
    my @arr1 = $e->[0]->@*;
    my @arr2 = $e->[1]->@*;

    my $mm = missing_members(\@arr1, \@arr2);
    say 'Input : @arr1 = ', dump(\@arr1);
    say '        @arr2 = ', dump(\@arr2);
    say 'Output : ', dump($mm);
    say ' ';
}
