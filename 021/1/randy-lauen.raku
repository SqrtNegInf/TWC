#!/usr/bin/env raku

my $e = 0;
for ^20 -> $n {
    $e += 1/factorial($n);
}
say "Calculated e = $e";
say "Perl6 e      = {e}";

sub factorial( Int $n where * >= 0 ) {
    return 1 if $n == 0;
    return $n * factorial( $n - 1 );
}
