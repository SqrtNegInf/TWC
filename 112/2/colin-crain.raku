#!/usr/bin/env raku
#
#
#       one-two-up-we-go.raku
#
#
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



unit sub MAIN () ;

sub fib ( $n ){ 
    state @fib;
    return @fib[$n] when @fib[$n].defined;
    return @fib[$n] = $n if $n < 2;
    @fib[$n] = fib($n-1) + fib($n-2);
}

for 1..20 {
    my ($s, $v, $p) = ('s', 'are', 'them');
    $_ == 1 and ($s, $v, $p) = (' ', 'is ', 'it');
    printf "for %2d step%s there %s %5d way%s to climb %s\n", 
        $_, $s, $v, fib($_+1), $s, $p;

}
