#!/bin/sh
#
# (c) 2003-2007 Linbox FAS, http://linbox.com
# (c) 2008-2009 Mandriva, http://www.mandriva.com
#
# $Id$
#
# This file is part of Pulse 2, http://pulse2.mandriva.org
#
# Pulse 2 is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Pulse 2 is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Pulse 2; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.
#
# Launch all postinstall scripts
#


# Functions which can be interesting in the postinst scripts

. /usr/lib/revolib.sh
. /opt/lib/libpostinst.sh

getmac

# 1st execute the global preinst
if [ -r /revoinfo/preinst ]
then
    pretty_warn "Executing global preinst script"
    /bin/revosendlog 6
    . /revoinfo/preinst
    /bin/revosendlog 7
fi

# Image postinst or system postinst ?
if grep -q revosavedir /proc/cmdline
then
    # then the local image postinst
    if [ -r /revosave/postinst ]
    then
        pretty_warn "Executing local image postinst script"
        /bin/revosendlog 6
        set -v
        . /revosave/postinst
        set +v
        /bin/revosendlog 7
    fi

# or the local postinst
    if [ -r /revoinfo/$MAC/postinst ] ;then
        pretty_warn "Executing local postinst script"
        /bin/revosendlog 6
        set -v
        . /revoinfo/$MAC/postinst
        set +v
        /bin/revosendlog 7
    fi
fi

# and finally the global postinst
if [ -r /revoinfo/postinst ]
then
    pretty_warn "Executing global postinst script"
    /bin/revosendlog 6
    . /revoinfo/postinst
    /bin/revosendlog 7
fi