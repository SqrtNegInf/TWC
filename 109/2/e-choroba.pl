#!/usr/bin/env perl
use v5.36;

sub four_squares {
    my @numbers = @_;
    my %at;
    undef $at{ $numbers[$_] }{$_} for 0 .. $#numbers;
    for my $A (0 .. $#numbers) {
        for my $C (0 .. $#numbers) {
            next if $A == $C || ! exists $at{ $numbers[$A] - $numbers[$C] };

            for my $D (keys %{ $at{ $numbers[$A] - $numbers[$C] } }) {
                next if grep $D == $_, $C, $A;

                for my $E (0 .. $#numbers) {
                    next if grep $E == $_, $A, $C, $D;

                    for my $G (keys %{ $at{ $numbers[$D] + $numbers[$E] } }) {
                        next if $numbers[$A] + $numbers[$E]
                                 != $numbers[$G] + $numbers[$C]
                             || grep $G == $_, $C, $A, $E, $D;

                        my %_rest;
                        @_rest{0 .. 6} = ();
                        delete @_rest{ $A, $C, $D, $E, $G };
                        my @rest = keys %_rest;

                        for my $r ([@rest], [reverse @rest]) {
                            my ($B, $F) = @$r;
                            return @numbers[$A, $B, $C, $D, $E, $F, $G]
                                if $numbers[$A] + $numbers[$B]
                                    == $numbers[$G] + $numbers[$F];
                        }
                    }
                }

            }
        }
    }
    return
}

use Test::More;

require Algorithm::Permute;
sub slow_fs {
    my @numbers = @_;
    my $p = 'Algorithm::Permute'->new(\@numbers);
    while (my @p = $p->next) {
        return @p if $p[0] + $p[1] == $p[1] + $p[2] + $p[3]
                  && $p[0] + $p[1] == $p[3] + $p[4] + $p[5]
                  && $p[0] + $p[1] == $p[5] + $p[6];
    }
    return
}

sub valid {
    my @r = @_;
    return $r[0] + $r[1] == $r[1] + $r[2] + $r[3]
        && $r[0] + $r[1] == $r[3] + $r[4] + $r[5]
        && $r[0] + $r[1] == $r[5] + $r[6]
}

#for (1 .. 100) {
#    my @N = map int rand 10, 1 .. 7;
#    my @fs = four_squares(@N);
#    my @s  = slow_fs(@N);
#    is !!@fs, !!@s, "solvability @N";
#    ok valid(@fs), "valid result" if @fs;
#}

my @S = 1 .. 7;
my @U = (0, 1, 2, 5, 6, 8, 9);
ok valid(four_squares(@S));
ok valid(slow_fs(@S));
ok ! four_squares(@U);
ok ! slow_fs(@U);

done_testing();
