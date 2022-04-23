#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle NativeCall' if $*VM ~~ /jvm/;
die 'not ok - disabled: getrandom not found';

use NativeCall;

my %*SUB-MAIN-OPTS =
  :named-anywhere,
;

#| http://man7.org/linux/man-pages/man2/getrandom.2.html
sub MAIN (
  UInt  $bytes = 8, #= Number of random bytes (defaults to 8)
  UInt :$flags = 0,
  --> Nil
) {
  given Buf.allocate: $bytes {
    given .&getrandom: $bytes, $flags {
      when -1 {
        die sub strerror( int32 --> Str ) is native {*}(
          cglobal |( 'c'; 'errno'; int32 ) );
      }
      when * < $bytes { die 'got fewer bytes than requested' }
    }
    .say;
  }
}

sub getrandom ( Buf, size_t, uint32 --> ssize_t ) is native {*}
