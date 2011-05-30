<?php

require_once __DIR__.'/../app/bootstrap.php.cache';
require_once __DIR__.'/../app/AppKernel.php';
//require_once __DIR__.'/../app/bootstrap_cache.php.cache';
//require_once __DIR__.'/../app/AppCache.php';

use Tecbot\AMFBundle\Amf\Request;

//$kernel = new AppCache(new AppKernel('prod', false));
$kernel = new AppKernel('prod', false);
$kernel->loadClassCache();
$kernel->handleAmf(Request::createFromGlobals())->send();