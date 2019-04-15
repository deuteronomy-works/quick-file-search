# -*- coding: utf-8 -*-
import sys
import os

folder = ''
keywords = ['']
macthes = []

# crawl folder
# then crawl folder
# check each file
# match with keyword
# found a match
# write the full_path to the variable

def search(folder):
    
    folders = []
    files_to_crawl = []
    files_list = os.listdir(folder)
    for files_list_entry in files_list:
        path = folder + '/' + files_list_entry
        if not is_dir(path):
            files_to_crawl.append(path)
        else:
            folders.append(path)
    match(files_to_crawl)
    search_folders(folders)

def is_dir(arg):
    pass

def match(argv):
    pass

def search_folders(argv):
    pass
