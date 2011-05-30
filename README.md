Sandbox for the [AMFBundle][1]
========================

Installation from Git
---------------------

Run the following commands:

    git http://github.com/tecbot/AMFBundle-sandbox.git
    cd AMFBundle-sandbox
    rm -rf .git
    php bin/vendors.php

.. note::

    AMFBundle-sandbox does/can not use git submodules as you should not keep the
    `.git` directory.

Configuration
-------------

Change your gateway url in the `flash\src\acme\utils\Config.as` file.
The gateway is the url to your Symfony app (e.g. http://localhost/amf.php)

[1]: https://github.com/tecbot/AMFBundle