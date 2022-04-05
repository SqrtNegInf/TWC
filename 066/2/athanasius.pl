#!/usr/bin/env perl

use Modern::Perl   qw( 2018 );
use Const::Fast;
use Regexp::Common qw( number );

const my $USAGE  => <<~EOS;
          Usage:
            perl $0 <N> -- an integer
          EOS

#===============================================================================
MAIN:
#===============================================================================
{

    my $N    = 64;
    my $done = 0;

    if ($N > 1)
    {
        my $powers = find_powers($N);

        if (scalar @$powers)
        {
            print join('  ', @$powers), "\n";
            $done = 1;
        }
    }

    print "0\n" unless $done;
}

#-------------------------------------------------------------------------------
sub find_powers
#-------------------------------------------------------------------------------
{
    my ($N) = @_;
    my  @powers;

    # The minimum exponent n is 2, since n > 1 (given)
    # The maximum exponent n is that for which the base m is minimum (also 2),
    #     so  2^n = N  =>  n = log⸤2⸥(N)

    my $max_n = int( log($N) / log(2) );

    for my $n (2 .. $max_n)                         # exponent
    {
        my $m = int( ($N ** (1 / $n)) + 0.5 );      # base
        my $p = int( ($m ** $n)       + 0.5 );      # power

        push @powers, "$m^$n" if $p == $N;
    }

    return \@powers;
}

################################################################################
