#!/usr/bin/env raku


sub MAIN($table=11) {

    # header
    print "  x|";
    print frmt($_) for 1..$table;
    print "\n";
    print "---+";
    say   "----" x $table;

    # body
    for 1..$table -> $i {
        print frmt($i,3) ~ "|";
        print "    "      for 1..$i-1;
        print frmt($i*$_) for $i..$table;
        print "\n";
    }
}

sub frmt($i, $pad=4, --> Str) {
    return sprintf("%{$pad}s",$i);
}
