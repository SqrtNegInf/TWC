#!/usr/bin/env perl

no strict; 
no warnings; 
use feature 'say';

say $_ for map { (fizz)[$_%3].(buzz)[$_%5]||$_ } 1..20 
