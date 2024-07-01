#!/usr/bin/env raku

sub MAIN(
    Str $str,
    *@keys
 ) {

    my $keys = [~] '<[', @keys, ']>';
    $str.words.grep({ $_ !~~ m:i/ <$keys> / }).elems.say;
}