#!/usr/bin/env raku

sub is-palindrome($n --> Bool:D) { $n.flip == $n }

sub is-lynchel($n --> Bool:D) {
    my $m = $n;
    my $cnt;

    repeat {
        return False if is-palindrome($m);

        $m += $m.flip;
        ++$cnt;
    } while $cnt < 500;

    ! is-palindrome($m)
}

#sub MAIN(UInt:D $n) {
    put +is-lynchel($_) for 56,57,59,196;
#}
