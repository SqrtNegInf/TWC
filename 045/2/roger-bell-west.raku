#!/usr/bin/env raku

my $f=open :r,$*PROGRAM-NAME;
for $f.lines {
  say $_;
}
