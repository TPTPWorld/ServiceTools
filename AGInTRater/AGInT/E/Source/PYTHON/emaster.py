#!/usr/bin/env python2.5

"""
emaster 0.1

Usage: emaster.py <config_file> [jobfile]...

Run a master process waiting for E-server announcements and
distibuting E jobs to the recognized servers. 

Options:

-h Print this help.

Copyright 2008 Stephan Schulz, schulz@eprover.org

This code is part of the support structure for the equational
theorem prover E. Visit

 http://www.eprover.org

for more information.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program ; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston,
MA  02111-1307 USA 

The original copyright holder can be contacted as

Stephan Schulz (I4)
Technische Universitaet Muenchen
Institut fuer Informatik
Boltzmannstrasse 3
Garching bei Muenchen
Germany

or via email (address above).
"""

import sys
import getopt
import pylib_io
import pylib_emconf
import pylib_emaster


if __name__ == '__main__':
    opts, args = getopt.gnu_getopt(sys.argv[1:], "hv", ["Verbose"])

    for option, optarg in opts:
        if option == "-h":
            print __doc__
            sys.exit()
        elif option == "-v" or option =="--verbose":
            pylib_io.Verbose = 1
        else:
            sys.exit("Unknown option "+ option)

    if len(args)<1:
        print __doc__
        sys.exit()

    config = pylib_emconf.e_mconfig(args[0])
    master = pylib_emaster.emaster(config)

    for arg in args[1:]:
        master.add_strat(arg)


    master.process()
