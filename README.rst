Mayan EDMS - An electronic vault for your documents. 
========================================

`Mayan EDMS`_ is a Free Open Source Electronic Document Management System,
coded in the Python language using the Django web application framework 
and released under the Apache 2.0 License. It provides an electronic vault
or repository for electronic documents.

This appliance includes all the standard features in `TurnKey Core`_:

- Mayan EDMS 2.1 installed via PIP from `PyPI`_
- Includes all pre-reqs: Virtualenv/Django/uWSGI/Celery/Redis/Supervisor
- SSL support out of the box.
- PostgreSQL is is installed as Mayan's backend database 
- `Adminer`_ administration frontend for PostgreSQL (listening on
  port 12322 - uses SSL).
- Nginx web server to host the webUI
- Webmin modules for configuring PostgreSQL.

For a roadmap on where this appliance is heading, visit the 
`upstream`_ branch of the Mayan EDMS  TKL build code and the release
`roadmap`_ on Github

Credentials *(passwords set at first boot)*
-------------------------------------------

-  Webmin, SSH: username **root**
-  PostgreSQL, Adminer: username **postgres**
-  Mayan EDMS Admin Account: **admin**

.. _Mayan EDMS: http://www.mayan-edms.com
.. _PyPI: https://pypi.python.org/pypi/mayan-edms
.. _TurnKey Core: https://www.turnkeylinux.org/core
.. _Adminer: http://www.adminer.org/
.. _upstream: https://github.com/DocCyblade/tkl-mayan-edms
.. _roadmap: https://github.com/DocCyblade/tkl-mayan-edms/milestones
