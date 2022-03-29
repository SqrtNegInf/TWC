#!/usr/bin/env raku

say <abcdabcd abcdabcdabcdabcd>.map({ /^ (.+) $0+ $/; $0 }).grep(so *).map(~*).unique;
