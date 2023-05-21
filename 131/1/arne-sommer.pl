#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Perl6::Junction 'all';

my $verbose = 0;

GetOptions("verbose" => \$verbose);

#die "Integers only" unless all(@ARGV) == qr/^\d+$/;

my @result;

my @A = (1, 2, 3, 6, 7, 8, 9);

my $current = shift(@A) // die "No numbers";
my @current = ($current);

say ": Candidate: $current" if $verbose;

for my $i (@A)
{
  if ($i > $current +1)
  {
    my @copy = @current;
    push(@result, \@copy);
    say ": Push: [", join(",", @current), "]" if $verbose;
    @current = ();
  }

  die "Not sorted ($current < $i)" unless $i > $current;
  
  say ": Candidate: $i" if $verbose;
  
  push(@current, $i);
  $current = $i;
}

push(@result, \@current) if @current;

say "(", join(", ", map { "[" . join(", ", @$_) . "]" } @result), ")";

