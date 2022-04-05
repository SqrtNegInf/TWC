#!/usr/bin/env perl

use strict;
use warnings;
use Algorithm::Loops qw( NestedLoops );
use Const::Fast;

const my %LETTERS =>
(
    1  => [ '_', ',', '@' ],
    2  => [ qw( A B C   ) ],
    3  => [ qw( D E F   ) ],
    4  => [ qw( G H I   ) ],
    5  => [ qw( J K L   ) ],
    6  => [ qw( M N O   ) ],
    7  => [ qw( P Q R S ) ],
    8  => [ qw( T U V   ) ],
    9  => [ qw( W X Y Z ) ],
   '*' => [ ' '           ],
    0  => [               ],
   '#' => [               ],
);

#===============================================================================
MAIN:
#===============================================================================
{
    #print "Challenge 067, Task #2: Letter Phone (Perl)\n\n";

    my $digits = [2, 4, 9];
    my @loops;

    for my $digit (@$digits)
    {
        my   @letters = $LETTERS{ $digit }->@*;
        push @loops, \@letters if scalar @letters > 0;
    }

    my @combinations;

    NestedLoops
    (
        \@loops,
        sub
        {
            push @combinations, sprintf '"%s"', join '', map { lc $_ } @_;
        },
    );

    printf "[%s]\n", join ', ', @combinations;
}
