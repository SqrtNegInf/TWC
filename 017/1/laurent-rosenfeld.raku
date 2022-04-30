#!/usr/bin/env raku

subset Positive of Int where * >= 0;

multi ack (0, Positive \n) { n + 1 }
multi ack (Positive \m, 0) { ack(m - 1, 1) }
multi ack (Positive \m, Positive \n) {
    ack(m - 1, ack(m, n - 1))
}

#sub MAIN (Positive \m, Positive \n) { say ack +m, +n; }

say ack(0,0);
say ack(1,0);
say ack(1,1);
say ack(1,2);
