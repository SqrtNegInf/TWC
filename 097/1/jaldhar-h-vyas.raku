#!/usr/bin/env raku

sub MAIN(
    Str $S = 'RAKU ROCKS', #= a message to encrypt
    Int $N = 13  #= number of letters to shift left in cipher
) {
    my @plain = < A B C D E F G H I J K L M N O P Q R S T U V W X Y Z >;
    my @cipher = @plain.rotate(-$N);

    $S.trans(@plain => @cipher).say;
}
