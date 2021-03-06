<?php

/**
 * @copyright Copyright (C) Ibexa AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */
namespace eZ\Bundle\EzPublishCoreBundle\Translation;

/**
 * Interface for collecting translations.
 */
interface Collector
{
    /**
     * @return array
     */
    public function collect();
}
