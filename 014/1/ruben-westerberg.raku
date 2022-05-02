#!/usr/bin/env raku

my $nn = @*ARGS[0]//100;
die "Please specify an argument greater or equal to 0 \n" if $nn < 0;
my @a=(0);
for 0..^$nn -> $n {
	my $max= @a[0..^$n].grep(@a[$n],:k).max();
	@a[$n+1]=$max == -Inf??0!!$n-$max;
}
put join ", ",@a;
