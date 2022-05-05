#!/usr/bin/env perl
# vi:et:sw=4 ts=4 ft=perl
#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;
use utf8;
use Data::Dumper;

use constant LARGEST_ROMAN_NUMBER => 3_999;

sub number_to_roman {
    my ($number, $debug) = @_;

    return '' if ($number > LARGEST_ROMAN_NUMBER);

    $debug //= 0;

    my %map = (
        1_000 => 'M',
        900   => 'CM',
        500   => 'D',
        400   => 'CD',
        100   => 'C',
        90    => 'XC',
        50    => 'L',
        40    => 'XL',
        10    => 'X',
        9     => 'IX',
        5     => 'V',
        4     => 'IV',
        1     => 'I',
    );

    my ($number_to_convert, @number_parts, @roman_parts) = ($number);
    foreach my $divisor (reverse sort { $a <=> $b } keys %map) {
        my $quotients = int($number_to_convert / $divisor);
        if ($quotients) {
            my $dividend = $quotients * $divisor;

            push @number_parts, $dividend;
            push @roman_parts, $map{$divisor} x $quotients;

            $number_to_convert = $number_to_convert - $dividend;
        }
    }

    my $roman = join '', @roman_parts;

    if ($debug) {
        say sprintf "%s = %s = %s = %s",
            $number,
            (join ' + ', @number_parts),
            (join ' + ', @roman_parts),
            $roman
    }

    return $roman;
}

sub roman_to_number {
    my ($roman, $debug) = @_;

    $roman = uc $roman;
    $debug //= 1;

    my %map = (
        M  => 1_000,
        CM => 900,
        D  => 500,
        CD => 400,
        C  => 100,
        XC => 90,
        L  => 50,
        XL => 40,
        X  => 10,
        IX => 9,
        V  => 5,
        IV => 4,
        I  => 1,
    );

    my ($number, @number_parts, @roman_parts) = (0);
    foreach my $char (reverse sort { $map{$a} <=> $map{$b} } keys %map) {
        while ($roman =~ s/^$char//i) {
            $number = $number + $map{$char};
            push @number_parts, $map{$char};
            push @roman_parts, $char;
        }
    }

    if ($debug) {
        say sprintf '%s = %s = %s',
            $number,
            (join ' + ', @number_parts),
            (join ' + ', @roman_parts),
    }
    return $number;
}

my @fixtures = (
    39, 246, 789, 2421, 160, 207, 1009, 1066, 1776, 1954, 2014, 2019, 3999, 4000,
);

say 'Number to Roman Numerals';
say sprintf "%s = %s\n", $_, number_to_roman($_, 1) foreach @fixtures;

say "\nRoman Numerals to Number";
say sprintf "%s = %s\n", $_, roman_to_number(number_to_roman($_), 1) foreach @fixtures;
