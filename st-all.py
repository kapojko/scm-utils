#!/usr/bin/python

import argparse, os

start_dir = os.getcwd()

def test_dir(dir, detailed_output = False) :
  prev_dir = os.getcwd()
  os.chdir(dir)
  cur_dir = os.path.join(prev_dir, dir)
  
  dir_type = ""
  subdirs = os.listdir(".")
  if ".svn" in subdirs :
    dir_type = "svn"
  elif ".git" in subdirs :
    dir_type = "git"
  elif ".bzr" in subdirs :
    dir_type = "bzr"
  elif ".hg" in subdirs :
    dir_type = "hg"

  if dir_type != "":
    print_path = os.path.relpath(cur_dir, start_dir)
    print("==== " + print_path + " ==== (" + dir_type+ ")")
    if dir_type == "svn" :
      os.system("svn st")
    elif dir_type == "git" :
      if detailed_output :
        os.system("git status")
      else :
        os.system("git status -s")
    elif dir_type == "bzr" :
      os.system("bzr st")
    elif dir_type == "hg" :
      os.system("hg st")
  else :
    for subdir in subdirs :
      if os.path.isdir(subdir) :
        test_dir(subdir, detailed_output)
        
  os.chdir(prev_dir)

# Parse command line
parser = argparse.ArgumentParser(description = 'Recursive SCM status.')
parser.add_argument('start_dir', metavar = 'DIR', default = '.',
    nargs = '?', help = 'directory for processing')
parser.add_argument('-d', '--detailed-output', action = 'store_const',
    const = True, default = False, help = 'produce detailed output',
    dest = 'detailed_output')
args = parser.parse_args()

test_dir(args.start_dir, args.detailed_output)
print("Done")
