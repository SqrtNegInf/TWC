#!/usr/bin/env perl
use v5.36;

BEGIN {
  use File::Basename qw(dirname);
  chdir(dirname($0));
}

#use readN qw(readN); # in-line the package

#package readN;

use Fcntl qw(:DEFAULT);
use Time::HiRes qw(usleep);

my %FH;
my %EOF;

sub readN {
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

