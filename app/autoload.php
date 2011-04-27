<?php

use Symfony\Component\ClassLoader\UniversalClassLoader;

$loader = new UniversalClassLoader();
$loader->registerNamespaces(array(
        'Symfony' => array(__DIR__.'/../vendor/symfony/src', __DIR__.'/../vendor/bundles'),
        'Tecbot' => __DIR__ . '/../vendor/bundles',
        'Monolog' => __DIR__ . '/../vendor/monolog/src',
        'Zend' => __DIR__ . '/../vendor/zend/lib',
        'Acme' => __DIR__.'/../src',
));
$loader->registerPrefixes(array(
        'Twig_' => __DIR__ . '/../vendor/twig/lib',
));
$loader->register();
$loader->registerPrefixFallback(array(
    __DIR__.'/../vendor/symfony/src/Symfony/Component/Locale/Resources/stubs',
));