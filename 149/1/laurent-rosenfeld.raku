#!/usr/bin/env raku

sub MAIN (Int $max = 20) {       # 20: default input value

    die 'not ok' if $*VM ~~ /jvm/; # JVM 2021.11 does nothing, slowly  At least it used to crash promptly...

    my $fibo = set(0, 1, * + * ...^  * > 1000);
    my $count = 0;
    my @numbers = gather {
        for 0 .. Inf -> $num {
            if $num.comb.sum (elem) $fibo {
                take $num;
                $count++;
                last if $count >= $max;
            }
        }
    }
    say my $result = "{@numbers}";
    use Test;
    is $result, '0 1 2 3 5 8 10 11 12 14 17 20 21 23 26 30 32 35 41 44';
}

=finish

JVM 2020.11:

Exception in thread "main" org.raku.nqp.runtime.UnwindException
    at org.raku.nqp.runtime.ThreadContext.<init>(ThreadContext.java:127)
    at org.raku.nqp.runtime.GlobalContext.getCurrentThreadContext(GlobalContext.java:348)
    at org.raku.nqp.runtime.GlobalContext.<init>(GlobalContext.java:253)
    at org.raku.nqp.runtime.CompilationUnit.enterFromMain(CompilationUnit.java:56)
    at perl6.main(gen/jvm/rakudo.nqp)
