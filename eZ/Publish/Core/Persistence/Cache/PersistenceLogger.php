<?php
/**
 * File containing the Persistence Cache SPI logger class
 *
 * @copyright Copyright (C) 1999-2012 eZ Systems AS. All rights reserved.
 * @license http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 * @version //autogentag//
 */

namespace eZ\Publish\Core\Persistence\Cache;

/**
 * Log un-cached use of SPI Persistence
 */
class PersistenceLogger
{
    /**
     * @var int
     */
    protected $count = 0;

    /**
     * @var array
     */
    protected $calls = array();

    /**
     * @param string $method
     * @param array $arguments
     */
    public function logCall( $method, array $arguments = array() )//, $microTime = 0 )
    {
        $this->count++;
        $this->calls[] = array(
            'method' => $method,
            'arguments' => $arguments,
            //'microTime' => $microTime
        );
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'PersistenceLogger';
    }

    /**
     * @return int
     */
    public function getCount()
    {
        return $this->count;
    }

    /**
     * @return array
     */
    public function getCalls()
    {
        return $this->calls;
    }
}
