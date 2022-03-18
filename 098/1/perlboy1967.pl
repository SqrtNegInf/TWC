#!/usr/bin/env perl

# Perl Weekly Challenge - 098
# - https://perlweeklychallenge.org/blog/perl-weekly-challenge-098/
#
# Task 1 - Read N-characters
#
# Author: Niels 'PerlBoy' van Dijke

BEGIN {
  use File::Basename qw(dirname);
  chdir(dirname($0));
}

use v5.16;
use strict;
use warnings;

#use readN qw(readN); # in-line the package

#package readN;

use Fcntl qw(:DEFAULT);
use Time::HiRes qw(usleep);

my %FH;
my %EOF;

sub readN ($$) {
  my ($fileName, $length) = @_;

  # Close the file when eof is reached
  if (exists $EOF{$fileName}) {
    delete $FH{$fileName};
    delete $EOF{$fileName};
    return;
  }

  if (!exists ($FH{$fileName})) {
    sysopen($FH{$fileName}, $fileName, O_RDONLY) //
      die "Can't open '$fileName' ($!)";
    binmode($FH{$fileName});
  }

  my $return;
  my $retry = 10;
  do {
    my $buf;
    my $nread = sysread($FH{$fileName}, $buf, $length);
    if (!defined $nread) {
      $retry--; usleep 1_000;
    } elsif ($nread == 0) {
      $EOF{$fileName}++;
    } elsif ($nread <= $length) {
      $return .= $buf;
    }
  } while (!exists  $EOF{$fileName} and length($return // '') != $length and $retry);

  return $return;
}

# Unbuffered STDOUT
$|++;

@ARGV = qw(1 input1.txt input2.txt) 
  unless scalar(@ARGV);

my $len = shift @ARGV // 4;
my %files = map {$_ => 1} @ARGV;

do {
  foreach my $file (sort keys %files) {
    my $s = readN($file, $len);
    if (defined $s) {
      printf "$file |%s|\n", $s;
    } else {
      delete $files{$file};
    }
  }
} while (scalar(keys %files) > 0);

