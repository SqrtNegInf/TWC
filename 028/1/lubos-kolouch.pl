#!/usr/bin/env perl
use v5.36;

sub get_file_status {
    my $file = shift;

    return "The file does not exist." unless -e $file;

    return "The file is not readable." unless -r $file;

    return "The file is empty." if -z $file;

    return "The file is not regular." unless -f $file;

    return "The file content is ascii." if -T $file;

    return "The file content is binary.";
}

#say get_file_status($file);

# TESTS

use Test::More;

is (get_file_status($0),'The file content is ascii.');
is (get_file_status('.'),'The file is not regular.');
is (get_file_status('/dev/zero'),'The file is empty.');
is (get_file_status('glorp.pl'),'The file does not exist.');
#is (get_file_status('/etc/shadow'),'The file is not readable.');

done_testing;
