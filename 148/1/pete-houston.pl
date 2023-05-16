#!/usr/bin/env perl 
use v5.36;

use Lingua::EN::Nums2Words;
use Lingua::EN::Inflexion;

my @eban = grep { -1 == index num2word ($_), 'E' } 1 .. 100;
my $text = wordlist (@eban, {final_sep => ''});

print "The Eban numbers less than 101 are: $text.\n";
