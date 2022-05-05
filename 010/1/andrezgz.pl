#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my %roman_table = (
    'I'  => 1,
    'IV' => 4,
    'V'  => 5,
    'IX' => 9,
    'X'  => 10,
    'XL' => 40,
    'L'  => 50,
    'XC' => 90,
    'C'  => 100,
    'CD' => 400,
    'D'  => 500,
    'CM' => 900,
    'M'  => 1000
);

# Subtractive notation roman number validation
sub _is_valid_roman {
    return $_[0] =~ /
                        ^                       # String start
                        M{0,3}                  # Matching from 1000 to 3000
                        (?:CM|CD|D|D?C{0,3})?   # Matching from 100 to 900
                        (?:XC|XL|L|L?X{0,3})?   # Matching from 10 to 90
                        (?:IX|IV|V|V?I{0,3})?   # Matching from 1 to 9
                        $                       # String end
                    /xi;
}

sub encode_roman {
    my $number = shift;
    my $roman;

    foreach my $r (sort { $roman_table{$b} <=> $roman_table{$a} } keys %roman_table) {
        my $d = int($number / $roman_table{$r});
        next unless $d;
        $roman .= $r x $d;
        $number -= $roman_table{$r} * $d;
        last unless $number;
    }

    return $roman;
}

sub decode_roman {
    my @roman = split //, shift;
    my $number;

    while (my $c1 = shift @roman) {
        my $c2 = @roman ? $roman[0] : 0;
        if (!$c2 || $roman_table{$c1} >= $roman_table{$c2} ) {
            $number += $roman_table{$c1};
        } else {
            $number += $roman_table{$c2} - $roman_table{$c1};
            shift @roman;
        }
    }

    return $number;
}

my $arg = 56;
say my $str = encode_roman($arg);
say decode_roman(uc $str);
