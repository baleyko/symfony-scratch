<?php

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Bundle\FrameworkBundle;

class AppKernel extends Kernel
{
    /**
     * @return array
     */
    public function registerBundles(): iterable
    {
        return [
            new FrameworkBundle\FrameworkBundle(),
            new AppBundle\AppBundle(),
        ];
    }

    /**
     * @param LoaderInterface $loader
     * @return void
     */
    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load($this->getProjectDir().'/app/config/config.yml');
    }
}
