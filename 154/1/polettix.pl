#!/usr/bin/env perl
use v5.36;

say for missing_permutations(<PELR PREL PERL PRLE PLER PLRE EPRL EPLR ERPL ERLP ELPR ELRP RPEL RPLE REPL RELP RLPE RLEP LPER LPRE LEPR LRPE LREP>);

sub missing_permutations (@present) {
   my %present = map { $_ => 1 } @present;
   return grep {!$present{$_}++}
      map { join '', $_->@* }
      permutations(split m{}mxs, $present[0]);
}

sub permutations (@present) {
   my @indexes = 0 .. $#present;
   my @stack = (0) x @indexes;
   my @retval = [@present[@indexes]];
   my $sp = 0;
   while ($sp < @indexes) {
      if ($stack[$sp] < $sp) {
         my $other = $sp % 2 ? $stack[$sp] : 0;
         @indexes[$sp, $other] = @indexes[$other, $sp];
         push @retval, [@present[@indexes]];
         $stack[$sp]++;
         $sp = 0;
      }
      else {
         $stack[$sp++] = 0;
      }
   }
   return @retval;
}
