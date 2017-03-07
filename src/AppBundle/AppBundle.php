<?php

namespace AppBundle;

use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\HttpKernel\Bundle\Bundle;

class AppBundle extends Bundle
{
    /**
     * @param ContainerBuilder $container 
     */
    public function build(ContainerBuilder $container)
    {
        parent::build($container);
    }
}
