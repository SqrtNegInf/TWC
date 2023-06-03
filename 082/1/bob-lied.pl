#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $Verbose = 0;
GetOptions('verbose' => \$Verbose);

my ($M, $N) = (100, 500);

die Usage() unless $M && $N;
die Usage() unless $M > 0 && $N > 0;

sub factor($n)
{
    my $f = 2;
    my %factor = (1 => 1, $n => 1);
    my $sqrtf = int(sqrt($n));
    while ( $f <= $sqrtf )
    {
        if ( ($n % $f) == 0 )
        {
            my $otherf = $n / $f;
            $factor{$f} = $factor{$otherf} = 1;
        }
        $f++;
    }

    return sort { $a <=> $b } keys %factor;
}

sub both($m, $n)
{
    my (%union, %intersection);
    foreach my $e ( @$m, @$n)
    {
        $union{$e}++ && $intersection{$e}++;
    }
    return sort { $a <=> $b } keys %intersection;
}

my @fM = factor($M);
my @fN = factor($N);

my @same = both(\@fM, \@fN);

say "(", join(", ", @same), ")";
