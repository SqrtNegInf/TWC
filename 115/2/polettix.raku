#!/usr/bin/env raku

sub largest-multiple (@N is copy) {
   @N = @N.sort: {$^a leg $^b};
   for 0 ..^ @N.elems -> $i {
      next if @N[$i] % 2;
      @N.unshift(@N.splice($i, 1).Slip);
      return @N.reverse.join('');
   }
   return;
}

sub MAIN (*@inputs is copy) {
   @inputs = < 4 1 7 6 > unless @inputs.elems;
   say largest-multiple(@inputs);
}
