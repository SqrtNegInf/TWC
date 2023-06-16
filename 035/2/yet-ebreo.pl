#!/usr/bin/env perl
use v5.36;

my %m_decode = ( 
    "489335"  =>"0",
    "96119"   =>"1",
    "22391"   =>"2",
    "5495"    =>"3",
    "1367"    =>"4",
    "341"     =>"5",
    "1877"    =>"6",
    "7637"    =>"7",
    "30581"   =>"8",
    "122333"  =>"9",
    "23"      =>"A",
    "469"     =>"B",
    "1885"    =>"C",
    "117"     =>"D",
    "1"       =>"E",
    "349"     =>"F",
    "477"     =>"G",
    "85"      =>"H",
    "5"       =>"I",
    "6007"    =>"J",
    "471"     =>"K",
    "373"     =>"L",
    "119"     =>"M",
    "29"      =>"N",
    "1911"    =>"O",
    "1501"    =>"P",
    "7639"    =>"Q",
    "93"      =>"R",
    "21"      =>"S",
    "7"       =>"T",
    "87"      =>"U",
    "343"     =>"V",
    "375"     =>"W",
    "1879"    =>"X",
    "7543"    =>"Y",
    "1909"    =>"Z"
);

my $string_to_decode = '101010001110111011100010101';

sub decode {
    my $string = pop =~
    #Replace the assigned word gap with @
    s/0000000/@/gr =~
    #Replace the assigned char gap with #
    s/000/#/gr =~
    #Replace morse code with equivalent char from hash
    s/[01]+/$m_decode{oct "b$&"}/gre =~
    #Replace @ with space
    s/@/ /gr =~
    #Remove #'s
    s/#//gr;
    return $string
}

say "Decoded String: ".decode($string_to_decode);
