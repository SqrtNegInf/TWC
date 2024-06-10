#!/usr/bin/env perl

use v5.26;    # The Weekly Challenge - 3 June 2024
use warnings; # Peter Campbell Smith

defang_ip_address('192.168.1.245');
defang_ip_address('0.0.0.0');
defang_ip_address('255.255.255.255');
defang_ip_address('192.168.1.20');

sub defang_ip_address {
	
	$_[0] =~ m|(\d+).(\d+).(\d+).(\d+)|;
	say qq{\nInput:  \$ip = "$_[0]"\nOutput: "$1\[.]$2\[.]$3\[.]$4"};
}
