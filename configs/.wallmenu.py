#!/usr/bin/env python

import os
import re
import string
import sys
from os.path import isdir


# --------------------------------------------------------------------------- #
#                                 wallmenu.py                                 #
#                                version 0.3.0                                #
# --------------------------------------------------------------------------- #
# This script creates an openbox pipe menu to choose a wallpaper.
# You can configure what types of files are allowed, where to search for
# wallpapers, and what program to use to set the wallpaper.
# This script will also update a configuration file 
# (~/.config/openbox/wallmenurc) that stores the last set wallpaper.
# This means that you can add a line to your .xinitrc file to load the
# last set wallpaper on start-up.
# You can configure this script with the variables below.
# This script will recursively go through directories from the one you
# specify, searching for image files.
# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
#                            Using the config file                            #
# --------------------------------------------------------------------------- #
# To use the config file that stores the filename of the last set wallpaper,
# you can add a line to your .xinitrc file to load it on start-up. If you
# use Esetroot you can use this example, if not just replace the program
# command with your chosen program:
#
# Esetroot `cat ~/.config/openbox/wallmenurc`
#
# If you want to use this script with feh to set your wallpaper, you don't 
# need the script to update a config file. feh automatically inserts the full
# command string used to set the wallpaper into ~/.fehbg. In order to set the
# wallpaper back at the next startof openbox, just add the following to 
# ~/.xinitrc:
#
# eval `cat ~/.fehbg`
# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
#                             User configuration                              #
# --------------------------------------------------------------------------- #
# types of files accepted (list, seperated by a |)
filetypes = "jpg|png|gif|jpeg"
# directory where wallpapers are stored (must be long: no ~ symbol allowed)
directory = "/home/bradley/wallpaper"
# program to set wallpaper
program = "feh --bg-scale"
# store wallpaper name in a config file?
config = "no"
# --------------------------------------------------------------------------- #

def genmenu(start, directory):
	# get a directory list
	dirlist = os.listdir(directory)
	for d in dirlist:
		# set di to overall directory
		di = directory + "/" + d
		# if we get a dir, generate a menu
		if isdir(di):
			print ""
			print "  <menu id=\"" + di + "\" label=\"" + d + "\" >"
			genmenu(start, di)
			print "  </menu>"
		# if we get a file, check if it is a valid type
		else:
			if re.search(filetypes, string.lower(di)) > 0:
				# make fi variable just filename, without extension
				fi = string.replace(string.replace(di, directory, ""), "/", "")
				fi = fi[:string.rfind(fi, ".")]
				# if so, add it to the pipe menu
				print "  <item label=\"" + fi + "\">"
				# execute line to set wallpaper
				print "    <action name=\"Execute\"><execute>" + program + " \"" + di + "\"</execute></action>"
				# if we want to update config file, do so
				if config == "yes":
						print "    <action name=\"Execute\"><execute>~/.config/openbox/wallmenu.py " + di + "</execute></action>"
				print "  </item>"
			

def main(argv):
	
	# if we've been passed an argument update the config file with the arg
	if len(argv) == 1:
		os.system("echo " + argv[0] + " > ~/.config/openbox/wallmenurc")

	else:

		# start menu
		print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
		print "<openbox_pipe_menu>"
		
		# set the original start directory
		start = directory
		# generate menu
		genmenu(start, directory)
		
		# end menu
		print "</openbox_pipe_menu>"

# run the main() function		
if __name__ == "__main__":
	main(sys.argv[1:])
