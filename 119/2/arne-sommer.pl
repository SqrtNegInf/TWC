#! /usr/bin/env perl
use v5.36;

my $N = $ARGV[0] // 60;

my $count   = 1;
my $current = 1;

while ($count < $N)
{
  my @digits  = split(//, reverse($current));
  my $new     = "";
  my $add     = 1;
    
  for my $digit (split(//, reverse($current)))
  {
    if ($add)
    {
      if ($digit <= 2)
      {
        $digit++;
        $add = 0;
      }
      else
      {
        $digit = 1;
      }
    }
      
    $new = $digit . $new;
  }

  $new = "1$new" if $add; 
  $current = $new;

  $count++ unless $current =~ /11/;
}

say $current;
