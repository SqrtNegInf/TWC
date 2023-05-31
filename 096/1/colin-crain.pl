#!/usr/bin/env perl
use v5.36;

sub rev_sentence {

    return join ' ', reverse $_[0] =~ m/(\S+)/g;

}

say rev_sentence("    Perl and   Raku are  part of the same family  ");
