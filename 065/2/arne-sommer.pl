#!/usr/bin/env perl
use v5.36;

my $S = shift @ARGV || 'aabaab';

my @result;
my %match_with_remainder;
my $matches = 0;

for my $start (0 .. length($S) -2)
{
  check(substr($S, $start, 2), substr($S, $start + 2));
}

sub check($string, $remainder)
{

  check($string . substr($remainder, 0,1), substr($remainder, 1)) if length $remainder >= 1;

  if ($string eq reverse $string)
  {
    exit if $match_with_remainder{length $remainder};
    $match_with_remainder{length $remainder} = 1;
    push(@result, $string);
    $matches++;
    
    
    check(substr($remainder,0,2), substr($remainder,2)) if length $remainder >= 2;

    if (@result)
    {
      say join(", ", map { "'$_'" } @result);
      @result = ();
    }
  }
}

say "-1" unless $matches;
