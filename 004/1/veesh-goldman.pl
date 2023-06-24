#!/usr/bin/env perl
use v5.36;

#Here's a little hacky way of doing this: I'm encoding the digits
#of pi in unicode characters, and then turning them back into
#digits. I get between 4 and 5 digits per chinese character (or
#math symbol). It's a bit golfy, b/c I'm assuming whitespace
#counts towards the 'length' of the script. I'm counting 'length'
#by characters, not by bytes.

use utf8;print for'3.',map ord,split//,'㝏枧⌓纀閷┞⊉◴Ⓑ銆:';
say '';
print 4*atan2 1,1
