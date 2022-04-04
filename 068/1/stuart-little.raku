#!/usr/bin/env raku

sub transp(@a) { @a[0].keys.map({ @a[0..*-1;$_] }) }
sub zero_rows(@a) { @a.map({ ([*] @($_)) xx $_ }).map(*.Array) }

my @a=('101', '111', '111').map(*.comb.Array);
for (zip @a.&zero_rows, @a.&transp.&zero_rows.&transp, :with({ @($^a) Z* @($^b) })) {.say}

=finish

Run as <script> <space-separated binary strings>, each binary string representing a row, as in

<script> 101 111 111 to input the matrix

[1, 0, 1]
[1, 1, 1]
[1, 1, 1]
