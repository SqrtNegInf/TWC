#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $Verbose = 0;
GetOptions('verbose' => \$Verbose);

my ($A, $B, $C) = ('XXY', 'XXZ', 'XXXXZY');

die Usage() unless $A && $B && $C;

sub inter($s, $t, $c, $depth)
{
    #say "$depth: Enter [@$s] [@$t] [@$c]";
    # For each prefix of s that matches c
    my $longestPrefix = 0;
    my $lenS = $#$s;
    my $lenC = $#$c;
    for ( my $i = 0;  $i <= $lenS && $i <= $lenC && $s->[$i] eq $c->[$i] ; $i++ )
    {
        $longestPrefix++;
    }
    return 0 unless $longestPrefix;
    my $lastS = $#{$s};
    my $lastC = $#{$c};
    for my $len ( 1 .. $longestPrefix )
    {
        #say "depth: Try  s[0..$len] = '", join("", @{$s}[0..$len-1]), "' against [@$c]";
        my @shorterS = ( @{$s}[ $len .. $lastS ] );
        my @shorterC = ( @{$c}[ $len .. $lastC ] );

        return 1 if ( ! @shorterC );

        # Swap strings to check for interleaving
        return 1 if inter($t, \@shorterS, \@shorterC, $depth+1);
    }
    return 0;
}

my @A = split "", $A;
my @B = split "", $B;
my @C = split "", $C;

say inter(\@A, \@B, \@C, 0) || inter(\@B, \@A, \@C, 0);
