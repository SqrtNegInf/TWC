#!/usr/bin/env raku

sub MAIN(
	Str $separator = '/',
	@paths = </a/b/c/d /a/b/cd /a/b/cc /a/b/c/d/e>
){
	my @path=@paths>>.split($separator);
	@path=sort { $^a.elems <=> $^b.elems}, @path;
	my $min=+@path[0];
	@path.=map: *.[0..^$min];
	my @common=do loop (my $i=0;$i < $min;$i++) {
		my $s=@path[0..*-1;{$i}];
		(all $s) eq $s[0] ?? $s[0] !! ();
	}
	say @common.join($separator);
}

