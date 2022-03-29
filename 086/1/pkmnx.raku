#!/usr/bin/env raku

#sub MAIN( *@args where @args.all ~~ Int ) {

   my $A = 7;
   my @N = (10, 8, 12, 15, 5);

   my @res = (gather {
      my %h;
      for @N.permutations {
         %h{ $_[0] }{ $_[1] }++;
      }
      for %h.keys.sort -> $k {
         for %h{$k}.keys.sort -> $kk {
            take [ $k, $kk ] if $k - $kk == $A;
         }
      }
   });

   ( "Input: @N = (" ~ @N ~ ') and $A = ' ~ $A ).say;

   if ( @res.elems > 0 ) {
      "Output: 1 as".say;
      for (@res) -> ($f, $s) {
         "   $f - $s = $A".say;
      }
      exit(0);
   } else {
      "Output: 0".say;
      exit(1);
   }
    
#}
