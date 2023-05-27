#!/usr/bin/env perl
use v5.36;

sub preorder :prototype(&@);

sub new {
	my ($val, $lref, $rref) = @_;
	my $node = {val => $val, left => $lref, right => $rref};
	return $node;
}

sub preorder :prototype(&@) {
	my ($expr, $node) = @_;
	$_ = $node->{"val"};
	$node->{"val"} = &$expr;
	# the & forces it to run without the prototype
	# important because we switch from asking for an anon-block
	# to a code ref (which encapsulates that block)
	&preorder ($expr, $node->{"left"}) if $node->{"left"};
	&preorder ($expr, $node->{"right"}) if $node->{"right"};
}

sub print_tree {
	my $node = shift;
	preorder {print "Val: $_\n"; $_;} $node;
}

my $test = new 1, new (2, new (4, , new(7))), new (3, new (5), new (6));
#$test->{"left"} = new 2;
#$test->{"right"} = new 3;

print "(Preorder) Original:\n";
print_tree $test;
my $sum = 0;
preorder {$sum += $_; $_;} $test;
preorder {$sum - $_} $test;
print "(Preorder) Modified:\n";
print_tree $test;

#preorder &print, $test;
# experiment with function prototypes to make something similar to map for trees :)
#sub call_ref (&@) {
#	my ($f, $x) = @_;
#	$_ = $x;
#	print "test?\n";
#	return $f->($x);
#}

#print (call_ref {print "$_\n"; $_;} 10);

