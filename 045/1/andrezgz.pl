#!/usr/bin/env perl
use v5.36;

my @ARGV = "The quick brown fox jumps over the lazy dog";
# only lower-case letters from arguments form a string
my $msg = join '',
          map {my $w = lc $_; $w =~ s/[[:^lower:]]//g; $w }
          @ARGV or die "USAGE: $0 <message>";

my %cols;
# each letter is appended to the corresponding column
$cols{$_ % 8} .= substr $msg, $_, 1 for (0 .. (length $msg) -1 );

# coded message is formed by printing each column string in order
print join ' ', map { $cols{$_} } sort keys %cols;
