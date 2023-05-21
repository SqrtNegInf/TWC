#!/usr/bin/env perl
use v5.36;
foreach((16, 9, 15, 1243)){
    my $count=my @sequences=fib($_,1,1);
    say "Input: $_\nOutput: $count",
        $count?join "\n       =", "\nAs $_", map {join "+", @$_} @sequences
              :"";
}

sub fib {
    my ($number, $current, $previous)=@_;
    return
         $current>$number? ()
        :$current==$number? ([$current])
        :(
             fib($number,$current+$previous, $current),
             map {unshift @$_, $current; $_}
                 (fib($number-$current,$current+$previous, $current))
        );
}
