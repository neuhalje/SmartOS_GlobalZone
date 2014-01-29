About mbuffer
==================
mbuffer is a tool for buffering data streams with a large set of unique features:

*    direct support for TCP based network targets (IPv4 and IPv6)
*    ability to send to multiple targets in parallel (distribution mode)
*    support for multiple volumes
*    I/O rate limitation
*    high/low watermark based restart criteria
*    configurable buffer size
*    on the fly MD5 hash calculation
*    highly efficient, multi-threaded implementation 

It is especially useful, if you are writing backups to fast tape drives or libraries. Those drives tend to stop and rewind if they have a buffer underrun. This so called tape screwing reduces the lifetime of the motors.
mbuffer can prevent buffer underruns, if used correctly and speed up the whole backup process. Please read the man page for details, how to use it.

LICENSE
---------
GNU GPL 3


Homepage
---------
[http://www.maier-komor.de/mbuffer.html](http://www.maier-komor.de/mbuffer.html)
