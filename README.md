# free_ipa

## Workshop
https://github.com/freeipa/freeipa-workshop

# Version/Release/Distribution
$ rpm -q freeipa-server freeipa-client ipa-server ipa-client 389-ds-base pki-ca krb5-server

# Cache Problem

Try increasing your nsslapd-cachememsize and monitoring it closely.
> Using the size of id2entry.db4 is a good place to start, but that will
> not be enough.

# Bug? 
https://bugzilla.redhat.com/show_bug.cgi?id=1969787


Description of problem:
Memory leak in RPC server could allocate a lot of memory for print servers

On a heavily loaded Samba printserver with several hundred queque it was noted that after upgrading from 4.6 to 4.13 smbd processes were eating up memory over the cause of a few days.

As an example the smbd process with the highest resided set size was

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 7657 WIN\pet+  20   0 1369160 398484   7824 S   0,0  2,5   1:02.80 smbd

398 MB...

talloc report of the process:

  full talloc report on 'null_context' (total 153473847 bytes in 2253252 blocks)

153 MB....

The talloc report has a myriad duplicate printer related metadata objects. The talloc report is 2M lines, still grinding through it.
