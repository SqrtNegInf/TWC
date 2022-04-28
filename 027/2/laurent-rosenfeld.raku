#!/usr/bin/env raku

# made STDERR, kludged

class WatchedValue {
    has Int $.current-value is rw;
    has @.past-values = ();

    method get-past-values {
        return @.past-values;
    }
}

multi sub infix:<=:=> (WatchedValue $y, Int $z) {
    push $y.past-values, $y.current-value;
    $y.current-value = $z;
}
my $x = WatchedValue.new(current-value => 10);
say "Current: ", $x.current-value;
my $tmp1 = $x =:= 15;
say "Current: ", $x.current-value;
my $tmp2 = $x =:= 5;
say "Current: ", $x.current-value;
my $tmp3 = $x =:= 20;
say "Current: ", $x.current-value;
say "Past values: ", $x.get-past-values;
