#!/usr/bin/env raku

sub is-esthetic ( $n ) {

    $n.comb
      .rotor( 2 => -1 )
      .flat
      .map( (* - *).abs == 1 )
      .all
      .so

}

say is-esthetic 5456;
say is-esthetic 5457;
