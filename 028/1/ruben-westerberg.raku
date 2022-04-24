#!/usr/bin/env raku

# a lot of work for wrong answer...

my %ext;
data.lines.map({
	my @f=.split(/\s|\,/,:skip-empty);
	my $type= /^text\// ?? "text" !! "binary" given @f.shift;
	%ext{$_}=$type for @f;
});

<ruben-westerberg.raku ../00-blogs>.map({
	my $type=%ext{.IO.extension};
	$type="binary" if !$type;
	put "$_: The file content is $type";
});

#emulate perl5 DATA section... sort of..
sub data() {
	q:to/END/
	text/html                                        html htm shtml
	text/css                                         css
	text/xml                                         xml
	text/mathml                                      mml
	text/plain                                       txt
	text/vnd.sun.j2me.app-descriptor                 jad
	text/vnd.wap.wml                                 wml
	text/x-component                                 htc
	END	
}
