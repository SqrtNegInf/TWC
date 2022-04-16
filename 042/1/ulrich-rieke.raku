#!/usr/bin/env raku

for (1..50) -> $i {
  say "Decimal $i = Octal " ~ $i.base(8).Str ;
}
