#!/usr/bin/env perl
use v5.36;

use Const::Fast; # To use the constant in the regex.

const my $SECRET => 8;
const my $REGEX => qr/(.{1,${SECRET}})/;

my $message = "@ARGV" || "The quick brown fox jumps over the lazy dog";

sub encoding_message
{
     my $str = $_[0];
     $str =~ tr/ //ds;
     $str = lc $str;

     my @rows = map [split(//,$_)], ($str =~ /$REGEX/g);

     my @coded = map { my $idx = $_;
          my @slice = map $_->[$idx] // '', @rows; [@slice];
     } 0 .. $SECRET - 1;

     my $enc = join(' ', map join('',@$_), @coded);

     return $enc;
}

print encoding_message($message), $/;

sub decoding_message
{
     my $str = $_[0];
     my @words = map [split(//,$_)], split(' ', $str);
     my @txt = map { my $idx = $_;
          my @slice = map $_->[$idx] // '', @words; [@slice];
     } 0 .. $#words;

     my $dec = join('', map join('',@$_), @txt);
}

print decoding_message(encoding_message($message)), $/;
