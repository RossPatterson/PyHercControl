# PyHercControl

Tool to allow remote control of Hercules mainframe emulator

The current Hercules toolset does not have a tool to execute a command on the
console and wait for a specific reply.

This tool fills this gap. It works by connecting connecting to the HTTP console
facility pushing commands and polling the console. It uses comment "_markers_"
in the Hercules console so that it does not need to get the full console
history as it polls.

# Installation

Download
[herccontrol](https://github.com/RossPatterson/PyHercControl/raw/refs/heads/master/PyHercControl/src/herccontrol).
For almost any system, that's it.  For Windows, you can either rename it to
`herccontrol.py`, or write a quick wrapper command file named `herccontrol.bat`:

```bat
@py herccontrol %*
@exit /b %errorlevel%
```

# Instructions

    usage: herccontrol [-h] [-C LINES] [-d] [-f MARKER] [-H {3,4}] [-m] [-M LINES]
                       [-P MILLISECONDS] [-q] [-s] [-S LINES] [-t SECONDS]
                       [-u HOST[:PORT]] [-v] [-w REGEX]
                       command

    Tool to send commands to Hercules

    positional arguments:
      command               The command to send to Hercules

    options:
      -h, --help            show this help message and exit
      -C LINES, --max-console-size LINES, --maxconsolesize LINES
                            Max Console Size, default: 20
      -d, --debug           Debug mode (or HC_DEBUG=bool)
      -f MARKER, --from-mark MARKER, --frommark MARKER
                            Search log from mark point (returned from herccontrol -m)
      -H {3,4}, --hercules-version {3,4}
                            Version of Hercules, default: 3
      -m, --mark            Set and output mark point (to be used in herccontrol -f)
      -M LINES, --max-between-marks LINES
                            Max console size between marks, default: 50
      -P MILLISECONDS, --polling-time MILLISECONDS, --pollingtime MILLISECONDS
                            Polling Time, default: 250
      -q, --quiet           Quiet mode (no output)
      -s, --single          Single mode (only output last line)
      -S LINES, --start-history-size LINES, --starthistorysize LINES
                            Start History Size, default: 20
      -t SECONDS, --timeout SECONDS
                            Timeout (or HC_TIMEOUT=seconds), default: 30
      -u HOST[:PORT], --url HOST[:PORT]
                            Hostname and port (or HC_HOSTURL='host[:port]'),
                            default: 127.0.0.1:8038
      -v, --version         Show the version and exit.
      -w REGEX, --wait-for REGEX, --waitfor REGEX
                            The regex string we are waiting for

# History

This tool started out as [Adrian Sutherland's
HercControl](https://github.com/adesutherland/HercControl) project, which was
written in C++ with several external dependencies.  I fixed a
[couple](https://github.com/adesutherland/HercControl/pull/3)
[of bugs](https://github.com/adesutherland/HercControl/issues/4),
but while trying to fix another (one particular use being unable to capture
the console output), I ran into
[a series of build problems](https://github.com/adesutherland/HercControl/issues/5).
I eventually gave up trying to make HercControl build on all three platforms,
and decided to re-write it in a language with broad availabilty and where I
could use just the standard library - Python.  Thus PyHercControl was born.
I set the initial version to match the version of HercControl that I started
from.

This tool intentionally is named and accepts all the options as Adrian's
HercControl, to allow it to be a drop-in replacement. It also supports a few
options that Adrian's does not:

* `--hercules-version`, to adapt to differences between Hercules 3.x (_aka_ _Spinhawk_) and 4.x (_SDL Hyperion_)
* `--from-mark` in addition to `--frommark`
* `--max-console-size` in addition to `--maxconsolesize`
* `--polling-time` in addition to `--pollingtime`


Adrian's code was 
[released under The Unlicense](https://github.com/adesutherland/HercControl/commit/f219de1316ca812075d6a0dd8949dbf649d81a60),
allowing me to use it however I wanted.  I read it in depth, and wrote
several variations of this code, starting pretty close to his and moving
stepwise closer to the initial version in this repo.  All errors and omissions,
of course, are mine only.  This code is likewise released under The Unlicense,
both with thanks to Adrian, and also because that's my preferred license.

