#!/usr/bin/env perl
use v5.36;

my %entries;
chomp, $entries{$_}++ while (<DATA>); # count instances

print "Instances count:\n";
print join "\n",                                        # Print a line
      map  { sprintf '%s%s%d',                          # composed by
              $_,                                       # the entry name,
              "\t",                        # the separator (comma or tab),
              $entries{$_}                              # and the number of instances
           }
      reverse sort { $entries{$a} <=> $entries{$b} }    # from the sorted by number of instances (desc)
      keys %entries;                                    # entry list

print "\n";

__END__
apple
banana
apple
cherry
cherry
apple
