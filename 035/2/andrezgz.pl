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

my %morse_inv = map { $morse{$_} => $_ } keys %morse;

my %morse_bin_inv = (
    '1'        => \&add_dot   ,  # dot
    '111'      => \&add_dash  ,  # dash
    '0'        => sub { }     ,  # intra-character gap
    '000'      => \&add_char  ,  # character gap
    '0000000'  => \&add_word  ,  # word gap
);

my $seq    = '';
my $token  = '';
my $output = [ '' ];

my $bmc = '101010001110111011100010101';

foreach my $i (0 .. (length $bmc)-1 ) {
    my $actual = substr $bmc, $i, 1;
    my $next = substr $bmc, $i+1, 1;
    $seq .= $actual;
    if ($actual ne $next) {
        $morse_bin_inv{$seq}->();
        $seq = '';
    }
}
add_char();

print join ' ', @$output;
exit 0;


sub add_dot {
    $token .= '.';
}

sub add_dash {
    $token .= '-';
}
sub add_char {
    $output->[-1] .= $morse_inv{$token};
    $token = '';
}
sub add_word {
    add_char();
    push @$output, '';
}
