#!/usr/bin/env perl
##
# Create a script to demonstrate creating dynamic variable 
# name, assign a value to the variable and finally print 
# the variable. The variable name would be passed as command 
# line argument.

$variable_name ='foo';
$variable = $variable_name;
$$variable = 'boo';  
print "The value of \$$variable_name is $$variable.\n";  
