#!/usr/bin/env raku

my $i=0;
for (1..100) {
        state $rem=1;
        my $slice=$_*0.01*$rem;
        $rem-=$slice;
        state $ps=0;
        last if  $slice < $ps;
	$i=$_;
        $ps=$slice;
}
print "Guest with largest slice: $i\n";
