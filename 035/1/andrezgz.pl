#!/usr/bin/env perl
use v5.36;

my %morse = (
    A => '.-',      N => '-.',
    B => '-...',    O => '---',
    C => '-.-.',    P => '.--.',
    D => '-..',     Q => '--.-',
    E => '.',       R => '.-.',
    F => '..-.',    S => '...',
    G => '--.',     T => '-',
    H => '....',    U => '..-',
    I => '..',      V => '...-',
    J => '.---',    W => '.--',
    K => '-.-',     X => '-..-',
    L => '.-..',    Y => '-.--',
    M => '--',      Z => '--..',

    0 => '-----',   5 => '.....',
    1 => '.----',   6 => '-....',
    2 => '..---',   7 => '--...',
    3 => '...--',   8 => '---..',
    4 => '....-',   9 => '----.',
);

my %morse_bin = (
    '.'     => '1',         # dot
    '-'     => '111',       # dash
    'i-gap' => '0',         # intra-character gap
    'c-gap' => '000',       # character gap
    'w-gap' => '0000000',   # word gap
);

my $wgap = 0;

print   $wgap++ ? $morse_bin{'w-gap'} : '',
        join $morse_bin{'c-gap'},
        map {
            join $morse_bin{'i-gap'},
            map { $morse_bin{$_} }
            split //;
        }
        map { $morse{uc $_} }
        split //
        foreach ('SOS');
