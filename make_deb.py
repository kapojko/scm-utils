#!/usr/bin/env python

import string, os, stat, shutil, subprocess

# Package options
pkg_options = {
	'pkg_name': 'scm-utils',
	'architecture': "all",
	'build_system': 'gnulinux',
	'version': '1.0-1'}

# Package control
deb_control = string.Template("""
Package: scm-utils
Version: $version
Maintainer: Yury Kapoyko <yury.kapoyko@live.com>
Architecture: $architecture
Section: Version Control Systems
Description: Various helper utilities for SCM (Source Code Management) systems.
Depends: python
""").substitute(pkg_options)

def collect_files(pkg_root):
	# Library files
	os.makedirs(os.path.join(pkg_root, 'usr/lib/scm-utils'))
	os.makedirs(os.path.join(pkg_root, 'usr/bin'))
	
	shutil.copy('st-all.py', os.path.join(pkg_root, 'usr/lib/scm-utils'))
	os.chmod(os.path.join(pkg_root, 'usr/lib/scm-utils/st-all.py'), 0o755)
	os.symlink('/usr/lib/scm-utils/st-all.py', os.path.join(pkg_root, 'usr/bin/st-all')) 
	
	shutil.copy('up-all.py', os.path.join(pkg_root, 'usr/lib/scm-utils'))
	os.chmod(os.path.join(pkg_root, 'usr/lib/scm-utils/up-all.py'), 0o755)
	os.symlink('/usr/lib/scm-utils/up-all.py', os.path.join(pkg_root, 'usr/bin/up-all')) 
	
	# Package files
	os.makedirs(os.path.join(pkg_root, 'DEBIAN'))
	with open(os.path.join(pkg_root, 'DEBIAN', 'control'), 'w') as f:
		f.write(deb_control)

# Build packet
def build_packet(pkg_root):
	pkg_name = pkg_options['pkg_name'] + '.' + pkg_options['build_system'] + '_' + pkg_options['version'] + \
		'_' + pkg_options['architecture'] + '.deb'
	subprocess.check_call(['fakeroot', 'dpkg-deb', '--build', pkg_root, pkg_name])

# MAIN program

# Create package root
pkg_root = 'pkg_root'
if os.path.exists(pkg_root):
	raise Exception('Package root directory "' + pkg_root + '" already exists')

# Build packet
try:
	collect_files(pkg_root)
	build_packet(pkg_root)
finally:
	# Clean-up package root
	shutil.rmtree(pkg_root)
