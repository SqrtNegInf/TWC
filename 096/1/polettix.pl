#!/usr/bin/env perl
use v5.36;

sub reverse_words ($S) {
   join(' ', reverse split m{\s+}mxs, $S) =~ s{\s+\z}{}rmxs;
}

my $input = join(' ', @ARGV)
   || '    Perl and   Raku are  part of the same family  ';
say '<', reverse_words($input), '>';
