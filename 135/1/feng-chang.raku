#!/usr/bin/env raku

=begin usage

 ./ch-1.raku -- -1234

=end   usage

#sub MAIN(Int:D $N) {
for 1, 1234, 1234567 -> $N {
    given abs($N) {
        when $_.chars %% 2 { put 'even number of digits'; }
        when $_.chars  < 3 { put 'too short';             }
        default            { put $_.substr($_.chars div 2 - 1, 3) }
    }
}
