#!/usr/bin/env raku

sub MAIN ($from = 'a', $to = 'x') { copy-directory($from, $to) }

sub copy-directory (IO::Path() $from, IO::Path() $to) {
   for $from.dir -> $source {
      next unless $source.d;
      my $target = $to.child($source.basename).mkdir($source.mode);
      samewith($source, $target);
   }
}
