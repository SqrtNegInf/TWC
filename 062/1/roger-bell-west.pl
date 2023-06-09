#!/usr/bin/env perl
use v5.36;

use Getopt::Std;

my %o;
getopts('u',\%o);

my %l;

while (<DATA>) {
  chomp;
  my @e=split /@/,$_;
  my $k=lc($e[1]).'@'.$e[0];
  if ($o{u}) {
    delete $l{$k};
  }
  push @{$l{$k}},$_;
}

foreach my $k (sort keys %l) {
  print map {"$_\n"} @{$l{$k}};
}

__END__
name@example.org
rjt@cpan.org
Name@example.org
rjt@CPAN.org
user@alpha.example.org
