#!/usr/bin/env perl
#use v5.36;

no strict 'refs';
use warnings;

$variable_name ='foo';
$variable = $variable_name;
$$variable = 'boo';  
print "The value of \$$variable_name is $$variable.\n";  
