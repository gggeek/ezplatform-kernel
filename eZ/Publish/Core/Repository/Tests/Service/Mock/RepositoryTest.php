<?php

/**
 * @copyright Copyright (C) Ibexa AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */
namespace eZ\Publish\Core\Repository\Tests\Service\Mock;

use eZ\Publish\Core\Repository\Tests\Service\Mock\Base as BaseServiceMockTest;

/**
 * Mock test case for Repository.
 */
class RepositoryTest extends BaseServiceMockTest
{
    /**
     * Test for the beginTransaction() method.
     *
     * @covers \eZ\Publish\API\Repository\Repository::beginTransaction
     */
    public function testBeginTransaction()
    {
        $mockedRepository = $this->getRepository();
        $persistenceHandlerMock = $this->getPersistenceMock();

        $persistenceHandlerMock->expects(
            $this->once()
        )->method(
            'beginTransaction'
        );

        $mockedRepository->beginTransaction();
    }

    /**
     * Test for the commit() method.
     *
     * @covers \eZ\Publish\API\Repository\Repository::commit
     */
    public function testCommit()
    {
        $mockedRepository = $this->getRepository();
        $persistenceHandlerMock = $this->getPersistenceMock();

        $persistenceHandlerMock->expects(
            $this->once()
        )->method(
            'commit'
        );

        $mockedRepository->commit();
    }

    /**
     * Test for the commit() method.
     *
     * @covers \eZ\Publish\API\Repository\Repository::commit
     */
    public function testCommitThrowsRuntimeException()
    {
        $this->expectException(\RuntimeException::class);

        $mockedRepository = $this->getRepository();
        $persistenceHandlerMock = $this->getPersistenceMock();

        $persistenceHandlerMock->expects(
            $this->once()
        )->method(
            'commit'
        )->will(
            $this->throwException(new \Exception())
        );

        $mockedRepository->commit();
    }

    /**
     * Test for the rollback() method.
     *
     * @covers \eZ\Publish\API\Repository\Repository::rollback
     */
    public function testRollback()
    {
        $mockedRepository = $this->getRepository();
        $persistenceHandlerMock = $this->getPersistenceMock();

        $persistenceHandlerMock->expects(
            $this->once()
        )->method(
            'rollback'
        );

        $mockedRepository->rollback();
    }

    /**
     * Test for the rollback() method.
     *
     * @covers \eZ\Publish\API\Repository\Repository::rollback
     */
    public function testRollbackThrowsRuntimeException()
    {
        $this->expectException(\RuntimeException::class);

        $mockedRepository = $this->getRepository();
        $persistenceHandlerMock = $this->getPersistenceMock();

        $persistenceHandlerMock->expects(
            $this->once()
        )->method(
            'rollback'
        )->will(
            $this->throwException(new \Exception())
        );

        $mockedRepository->rollback();
    }
}
