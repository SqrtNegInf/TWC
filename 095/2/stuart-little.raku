#!/usr/bin/env raku
use v6;

sub stack_min (@stack,$mn) {
    (! @stack) && return $mn;
    my $popped=@stack.pop;
    return (stack_min(@stack,$mn),($mn,$popped).min).min
}

my @stack;

[2,-1,0,10,4].map({ @stack.push($_) });
say qq|Current stack: {@stack}|;
say qq|Popping: {@stack.pop}|;
say qq|Current stack: {@stack}|;
say qq|Peeking: {@stack.[*-1]}|;
say qq|Current stack: {@stack}|;
say qq|Stack minimum: {stack_min(@stack,Inf)}|;
say qq|Current stack: {@stack}|;
