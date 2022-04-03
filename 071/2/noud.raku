#!/usr/bin/env raku

class Node {
    has Int $.value is rw;
    has Node $.next is rw;

    method remove($N) {
        if ($N == 0) {
            return self.next;
        }

        my $cur = self;
        my $index = 0;
        while ($cur) {
            if ($index + 1 == $N) {
                $cur.next = $cur.next.next;
                return self;
            }
            $index++;
            $cur = $cur.next;
        }

        return self.next;
    }

    method display() {
        my $cur = self;
        my @values = [];
        while ($cur) {
            @values.push($cur.value);
            $cur = $cur.next;
        }
        @values.join(" -> ").say;
    }
}

my $n = Node.new();
my $cur = $n;
my @values = (0..10).reverse;
while (@values) {
    $cur.value = @values.pop;
    if (@values) {
        $cur.next = Node.new();
        $cur = $cur.next;
    }
}
$n.display();

$n = $n.remove(5);
$n.display;

$n = $n.remove(11);
$n.display;

$n = $n.remove(0);
$n.display;
