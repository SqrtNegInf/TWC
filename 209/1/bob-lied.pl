#!/usr/bin/env perl
digraph {
    rankdir="LR"

START -> a [label="0"];
START -> bc [label="1"];
a -> a [label="0"];
a -> bc [label="1"];
bc -> b [label="0"];
bc -> c [label="1"];
b -> a [label="0"];
c -> a [label="0"];
b -> bc [label="1"];
c -> bc [label="1"];
}
