#!/usr/bin/env raku
sub build-array ($a) {
  $a.keys.map( $a[$a[$_]] )
}
