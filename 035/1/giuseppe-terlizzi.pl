#!/usr/bin/env perl
use v5.36;


my %morse = (
    a => '10111',
    b => '111010101',
    c => '11101011101',
    d => '1110101',
    e => '1',
    f => '101011101',
    g => '111011101',
    h => '1010101',
    i => '101',
    j => '1011101110111',
    k => '111010111',
    l => '101110101',
    m => '1110111',
    n => '11101',
    o => '11101110111',
    p => '10111011101',
    q => '1110111010111',
    r => '1011101',
    s => '101010',
    t => '111',
    u => '1010111',
    v => '101010111',
    w => '101110111',
    x => '11101010111',
    y => '1110101110111',
    z => '11101110101',

    0 => '1110111011101110111',
    1 => '10111011101110111',
    2 => '101011101110111',
    3 => '1010101110111',
    4 => '10101010111',
    5 => '101010101',
    6 => '11101010101',
    7 => '1110111010101',
    8 => '111011101110101',
    
    9 => '11101110111011101',

    ' ' => '0000000',

);

my $string = 'SOS';
my @items  = split //, $string;

my $code = '';

foreach ( @items ) {

    my $b = $morse{lc($_)};
    my $s = $b;
    $s =~ s/111/—/g;
    $s =~ s/1/•/g;
    $s =~ s/0/ /g;

    #say "$_ : $b \t $s";
    
    say $s;
    #print "000";

    $code .= $b;
    $code .= '000';

}

$code =~ s/0000000000/0000000/g;
$code =~ s/000$//;

say $code;
