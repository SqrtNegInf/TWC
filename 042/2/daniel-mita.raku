#!/usr/bin/env raku

srand 1;

unit sub MAIN (
  UInt :$parens = 10,
);

my $count = 0;

for roll <( )>: (^$parens).pick {
  .say;
  when '(' { $count++ }
  when ')' { say 'close before open' and exit if --$count < 0  }
}

if $count {
  say "$count unclosed";
  exit;
}

'balanced'.say;
