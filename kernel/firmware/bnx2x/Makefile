#
# (c) 2011 Mandriva, http://www.mandriva.com
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
topdir = $(abspath ../../..)

extra_version = 0.40
extra_archive = firmware-bnx2x_$(extra_version)_all.deb
extra_uri = http://ftp.de.debian.org/debian/pool/non-free/f/firmware-nonfree/$(extra_archive)

include $(topdir)/common.mk

all-local: extract

clean-local:
	rm -rf sources/

$(extra_archive):
	wget $(extra_uri)

extract: $(extra_archive)
	dpkg --extract $(extra_archive) sources/ 

install-local: all-local
	mkdir -p $(DESTDIR)$(initramfsdir)/lib/firmware
	cp -a sources/lib/firmware/bnx2x $(DESTDIR)$(initramfsdir)/lib/firmware/
	chown -R root:root $(DESTDIR)$(initramfsdir)/lib/firmware/bnx2x
