#!/usr/bin/python

"""
Generate unique Mayan-EDMS secret leveraging Django (i.e. using the same 
method Mayan does on initial install)
"""

import sys
sys.path.append('/opt/mayan-edms/lib/python2.7/site-packages')

from django.utils.crypto import get_random_string

chars = 'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*(-_=+)'
secret_key = get_random_string(50, chars)

secret_key_file_path = '/opt/mayan-edms/media/system/SECRET_KEY'

with open(secret_key_file_path, 'w') as fob:
     fob.write(secret_key)
