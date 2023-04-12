#!/usr/bin/env perl

use v5.36;
no strict 'subs';
no warnings 'uninitialized';

#no strict; 
#no warnings; 
#use feature 'say';

say $_ for map { (fizz)[$_%3].(buzz)[$_%5]||$_ } 1..20 
