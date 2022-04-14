#!/usr/bin/env raku

my $target = 200;
my %hit := {1 => 1};
my $steps = 0;
repeat {
  for (%hit.keys.sort) -> $key { # if not sorted, all heck breaks loose, as modifying hash in loop
    #die "k:$key:" unless $key ~~ /^^ \d+ $$/;
    %hit{$key+1} = $key;
    %hit{$key*2} = $key;
  }
  $steps++;
} until %hit{$target};

say $steps;
