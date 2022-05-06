#!/usr/bin/env raku

multi is-niven( 0 --> False) is export { }

multi is-niven( Int:D $num where * > 0 ) is export {
    $num %% $num.comb.sum;
}

.put if is-niven($_) for 0..50;
