<?php

use Symfony\Component\HttpFoundation\Request;

require_once __DIR__.'/../vendor/autoload.php';

ini_set('display_errors', "on");
ini_set('error_reporting', E_ALL);

$kernel = new AppKernel('prod', true);
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);

