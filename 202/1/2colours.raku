#!/usr/bin/env raku

#use v6.*;           # why? [without, it crashes]
 use v6.e.PREVIEW;   # or use this

my token unsigned-integer { 0 | <[1..9]><[0..9]>* };
my token integer { '-'? <unsigned-integer> };
subset IntList of Str where /^ '(' <integer>* % ',' ')' $/;

  my Int() @array = (7,8,7,7,7);
  my $streak = 0;
  my $output is default(0) = do for @array {
    $streak = $_ %% 2 ?? 0 !! $streak + 1;
    last 1 if $streak == 2; 
  }.head;
  say $output;

=finish

Calling last(Int) will never work with any of these multi signatures:
    ( --> Nil)
    (Label:D $x --> Nil)
at 2colours.raku:14
------>     ⏏last 1 if $streak == 2;
