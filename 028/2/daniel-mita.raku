#!/usr/bin/env raku

die 'not ok - disabled: not testable';

my @num-groups = (^0x20000)
  .map( { .chr } )
  .grep( { .uniprop eq "Nd" } )
  .rotor(10)
  .map( { ( ^10 Z=> $_ ).Hash } );

for 1..1 {
  #run 'clear';
  given DateTime.now -> $t {
    for @num-groups -> %nums {
      once {print ' ' x 8 ~ "\t"}
      print $t.hh-mm-ss.comb.map( { %nums{$_}
        || do given %nums{0}.uniprop('Block') {
          when 'Arabic' {'؛'}
          when 'NKo'    {'߸'}
          default       {':'}
        }} ).join;
      print $++ % 3 ?? "\t" !! "\n";
    }
    sleep 0.1 while $t.whole-second == DateTime.now.whole-second;
  }
}

