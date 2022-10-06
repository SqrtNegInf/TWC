#!/usr/bin/env raku

    my @list = <ab1234 cd5678 ef1342>;
    my $seq = '00';
    my @output = @list.map({ $_.subst(/^../, $seq++)});
    @output.join(q{ }).say;
