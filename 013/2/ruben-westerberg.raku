#!/usr/bin/env raku

sub male ($n) {
	$n==0??0!!($n - female(male($n-1)));
}

sub female($n) {
	$n==0??1!!($n - male(female($n-1)));
}

my (@male, @female);

for (0..(@*ARGS[0]//14)) {  # crashes with 19 or above?
	push @female, female($_);
	push @male, male($_);
}

print "  Male sequence: ", @male.join(", "),"\n";
print "Female sequence: ", @female.join(", "),"\n";
