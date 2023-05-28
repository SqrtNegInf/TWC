#!/usr/bin/env perl
use v5.36;

# where 'module' is the name of the module to be inspected, and 
# this module is to be found in a file named 'module.pm' (with ::
# replaced by '/'), somewhere in @INC.
#

#
# Get the module name from the command line.
#
use lib '.';
my $module = 'Calc';

#
# Load the module.
#
eval "use $module; 1" or die "Failed to load $module.pm: $@";

#
# Create a reference to the symbol table of the module.
#
my $symbol_table = do {no strict 'refs'; \%{$module . "::"}};

#
# Iterate over the symbols in the name space, and print out
# which symbols have a code ref entry in the type glob.
# (The symbol table maps symbols to type globs).
#
# Note that this only gives use the global methods, no lexical
# subroutines are found that way. Which is ok, as lexical
# subroutines are bound to their lexical scope - not the package.
#
foreach my $symbol (sort keys %$symbol_table) {
       say $symbol  if *{$$symbol_table {$symbol}} {CODE};
}

#
# Print BEGIN. This is not a method. While there is a entry
# named "BEGIN" in the symbol table, the type glob does not
# have CODE entry. $module -> can ("BEGIN") fails as well.
#
# We only print "BEGIN" so we pass the one test given for
# this exercise.
#
# We will *NOT* do the same for END, INIT, CHECK, nor UNITCHECK.
# One piece of madness is enough.
#
say "BEGIN" if $$symbol_table {BEGIN} && !*{$$symbol_table {BEGIN}} {CODE};

#
# Note that if the module contains an AUTOLOAD method, one could argue
# the module contains any possible method. We decide to not do that.
#

__END__
