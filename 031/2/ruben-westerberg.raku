#!/usr/bin/env raku
use MONKEY-SEE-NO-EVAL;
my $name='foo';
my $value='boo';
{
	put "Using Module/eval";
	module D {
		EVAL "our \$$name=\"$value\"";
	}
	put $D::($name);
	put "Variable name: $name Value: {$D::($name)}";
}

put "";

{
	put "Using Hash";
	my %h;
	%h{$name}=$value;
	put "Variable name: $name Value: %h{$name}";

}
