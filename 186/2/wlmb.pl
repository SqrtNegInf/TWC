#!/usr/bin/env perl
use v5.36;

use Encode qw(decode encode);
use Unicode::Collate;
sub char2ascii($char){ # Convert single char to ascii
    state $coll=Unicode::Collate->new(level=>3, ignore_level2=>1); #Ignore accents, check case
    state @ascii=map {chr} (0x20..0x7e);
    $coll->cmp($_, $char)==0 && return $_ for @ascii; #return ascii if found
    $char # default
}

sub makeover($string){ # convert string to ascii
    join "", map {char2ascii $_} split "", $string
}

say encode("UTF-8", makeover(decode("UTF-8", $_))) for('ÃÊÍÒÙ');
