#!/usr/bin/env raku

#sub MAIN(*@args) {
    my Int $A = 7;
    my Int @N = (10, 8, 12, 15, 5);

    solve_it(@N, $A);
#}

sub solve_it(Int @integers, Int $diff) {
    # @integers list is immutable
    my Int @test = @integers.sort; # TODO: sort every time??
    my Int $high = @test.pop;
    my Int $rval = 0;
    
    for @test {
        $rval = 1 if $diff == $high - $_;
        last if $rval;
    }

    if !$rval && @test[1] {
        solve_it(@test, $diff)
    }
    else {
        say $rval;
        return;
    }
}
