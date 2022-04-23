#!/usr/bin/env raku

sub MAIN( @a  =[1, 3, 5, 7, 9 ] ) {
    my $out = -1;
    my $e = @a.end; for ( 0..$e ) -> $i {
        if ( ([+] @a[^$i]) ~~ ([+] @a[$i^..$e]) ) {
            say $i;
            $out = '';
        }
    }
    say $out if $out;
}
