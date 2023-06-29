#!/usr/bin/env perl
#use v5.36; # this kind of trickery harder now

no strict 'refs';

$variable_name ='foo';
$variable = $variable_name;
$$variable = 'boo';  
print "The value of \$$variable_name is $$variable.\n";  
