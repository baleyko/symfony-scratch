<?php

namespace AppBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class IndexController
{
    /**
     * @return Response
     */
    public function indexAction(Request $request) : Response
    {
        return new Response();
    }
}
