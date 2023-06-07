#!/usr/bin/env perl
use v5.36;

my $limit = $ARGV[0] // 7;

sub switch ($string)
{
  return join("", map { $_ eq "1" ? 0 : 1 } split("", $string));
}

my $prev = "";

for my $counter (0 .. $limit)
{
  say "S" . $counter++ . " = \"$prev\"";
  $prev = $prev . "0" . switch(reverse($prev));
}
