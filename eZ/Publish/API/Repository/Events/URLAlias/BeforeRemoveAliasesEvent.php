<?php

/**
 * @copyright Copyright (C) Ibexa AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */
declare(strict_types=1);

namespace eZ\Publish\API\Repository\Events\URLAlias;

use eZ\Publish\SPI\Repository\Event\BeforeEvent;

final class BeforeRemoveAliasesEvent extends BeforeEvent
{
    /** @var array */
    private $aliasList;

    public function __construct(array $aliasList)
    {
        $this->aliasList = $aliasList;
    }

    public function getAliasList(): array
    {
        return $this->aliasList;
    }
}
