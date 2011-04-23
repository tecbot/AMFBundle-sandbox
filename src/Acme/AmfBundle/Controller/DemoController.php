<?php
namespace Acme\AmfBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;

class DemoController extends Controller
{
    public function indexAction()
    {
        $this->render('AcmeAmfBundle::index.html.twig');
    }
}
