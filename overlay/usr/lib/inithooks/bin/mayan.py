#!/usr/bin/python
"""Set Mayan EDMS admin password and email

Option:
    --pass=     unless provided, will ask interactively
    --email=    unless provided, will ask interactively

"""

import sys
import getopt
import inithooks_cache

from dialog_wrapper import Dialog
from pgsqlconf import PostgreSQL
from passlib.hash import django_pbkdf2_sha256 as djpass 


def usage(s=None):
    if s:
        print >> sys.stderr, "Error:", s
    print >> sys.stderr, "Syntax: %s [options]" % sys.argv[0]
    print >> sys.stderr, __doc__
    sys.exit(1)

def main():
    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], "h",
                                       ['help', 'pass=', 'email='])
    except getopt.GetoptError, e:
        usage(e)

    password = ""
    email = ""
    for opt, val in opts:
        if opt in ('-h', '--help'):
            usage()
        elif opt == '--pass':
            password = val
        elif opt == '--email':
            email = val

    if not password:
        d = Dialog('TurnKey Linux - First boot configuration')
        password = d.get_password(
            "Mayan EDMS Admin Password",
            "Enter new password for the Mayan EDMS 'admin' account.")

    if not email:
        if 'd' not in locals():
            d = Dialog('TurnKey Linux - First boot configuration')

        email = d.get_email(
            "Mayan EDMS Email",
            "Please enter email address for the Mayan EDMS 'admin' account.",
            "admin@example.com")

    inithooks_cache.write('APP_EMAIL', email)
    
    hashpass = djpass.encrypt(password)

    p = PostgreSQL(database='mayan')

    p.execute('UPDATE autoadmin_autoadminsingleton SET password = NULL, password_hash = NULL, account_id = NULL WHERE (id = 1);')
    p.execute('UPDATE auth_user SET email = \'%s\' WHERE username = \'admin\';' % email)
    p.execute('UPDATE auth_user SET password = \'%s\' WHERE username = \'admin\';' % hashpass)

if __name__ == "__main__":
    main()

