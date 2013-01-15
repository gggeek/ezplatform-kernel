<?php
/**
 * File contains Test class
 *
 * @copyright Copyright (C) 1999-2012 eZ Systems AS. All rights reserved.
 * @license http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2
 * @version //autogentag//
 */

namespace eZ\Publish\Core\Persistence\Cache\Tests;

use eZ\Publish\Core\Persistence\Cache\Handler as CacheHandler;
use eZ\Publish\Core\Persistence\Cache\SectionHandler as CacheSectionHandler;
use eZ\Publish\Core\Persistence\Cache\LocationHandler as CacheLocationHandler;
use eZ\Publish\Core\Persistence\Cache\ContentTypeHandler as CacheContentTypeHandler;
use PHPUnit_Framework_TestCase;

/**
 * Abstract test case for spi cache impl
 */
abstract class HandlerTest extends PHPUnit_Framework_TestCase
{
    /**
     * @var \Tedivm\StashBundle\Service\CacheService|\PHPUnit_Framework_MockObject_MockObject
     */
    protected $cacheMock;

    /**
     * @var \eZ\Publish\Core\Persistence\Factory|\PHPUnit_Framework_MockObject_MockObject
     */
    protected $persistenceFactoryMock;

    /**
     * @var \eZ\Publish\Core\Persistence\Cache\Handler
     */
    protected $persistenceHandler;

    /**
     * @var \eZ\Publish\Core\Persistence\Cache\PersistenceLogger|\PHPUnit_Framework_MockObject_MockObject
     */
    protected $loggerMock;

    /**
     * Setup the HandlerTest.
     *
     * @param array|null $persistenceFactoryMockMethods
     */
    protected function setUp( $persistenceFactoryMockMethods = array() )
    {
        parent::setUp();

        $this->persistenceFactoryMock = $this->getMock(
            "eZ\\Publish\\Core\\Persistence\\Factory",
            $persistenceFactoryMockMethods,
            array(),
            '',
            false
        );

        $this->cacheMock = $this->getMock(
            "Tedivm\\StashBundle\\Service\\CacheService",
            array(),
            array(),
            '',
            false
        );

        $this->loggerMock = $this->getMock( "eZ\\Publish\\Core\\Persistence\\Cache\\PersistenceLogger" );

        $this->persistenceHandler = new CacheHandler(
            $this->persistenceFactoryMock,
            new CacheSectionHandler( $this->cacheMock, $this->persistenceFactoryMock, $this->loggerMock ),
            new CacheLocationHandler( $this->cacheMock, $this->persistenceFactoryMock, $this->loggerMock ),
            new CacheContentTypeHandler( $this->cacheMock, $this->persistenceFactoryMock, $this->loggerMock ),
            $this->loggerMock
        );
    }

    /**
     * Tear down test (properties)
     */
    protected function tearDown()
    {
        unset( $this->cacheMock );
        unset( $this->persistenceFactoryMock );
        unset( $this->persistenceHandler );
        unset( $this->loggerMock );
        parent::tearDown();
    }
}
