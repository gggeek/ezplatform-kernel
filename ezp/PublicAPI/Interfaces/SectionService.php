<?php
/**
 * @package ezp\PublicAPI\Interfaces
 */
namespace ezp\PublicAPI\Interfaces;

use ezp\PublicAPI\Values\Content\ContentInfo;

use ezp\PublicAPI\Values\Content\Section;

use ezp\PublicAPI\Values\Content\Location;


/**
 * Section service, used for section operations
 * @package ezp\PublicAPI\Interfaces
 */
interface SectionService
{
    /**
     * Creates the a new Section in the content repository
     *
     * @param string $identifier
     * @param string $name
     *
     * @return Section The newly create section
     * @throws ezp\PublicAPI\Interfaces\UnauthorizedException If the current user user is not allowed to create a section
     * @throws ezp\PublicAPI\Interfaces\ForbiddenException If the new identifier already exists
     */
    public function createSection( $identifier, $name );

    /**
     * Updates the given in the content repository
     *
     * @param Section $section
     * @return Section
     * @throws ezp\PublicAPI\Interfaces\NotFoundException if section could not be found
     * @throws ezp\PublicAPI\Interfaces\UnauthorizedException If the current user user is not allowed to create a section
     * @throws ezp\PublicAPI\Interfaces\ForbiddenException If the new identifier already exists
     */
    public function updateSection( /*Section*/ $section );

    /**
     * Loads a Section from its id ($sectionId)
     *
     * @param int $sectionId
     * @return Section
     * @throws ezp\PublicAPI\Interfaces\NotFoundException if section could not be found
     * @throws ezp\PublicAPI\Interfaces\UnauthorizedException If the current user user is not allowed to read a section
     */
    public function loadSection( $sectionId );

    /**
     * Loads all sections
     *
     * @return array of {@link Section}
     * @throws ezp\PublicAPI\Interfaces\UnauthorizedException If the current user user is not allowed to read a section
     */
    public function loadSections();

    /**
     * Loads a Section from its identifier ($sectionIdentifier)
     *
     * @param string $sectionIdentifier
     * @return Section
     * @throws ezp\PublicAPI\Interfaces\NotFoundException if section could not be found
     * @throws ezp\PublicAPI\Interfaces\UnauthorizedException If the current user user is not allowed to read a section
     */
    public function loadSectionByIdentifier( $sectionIdentifier );

    /**
     * Counts the contents which $section is assigned to
     *
     * @param Section $section
     * @return int
     */
    public function countAssignedContents( /*Section*/ $section );

    /**
     * assigns the content to the given section
     * this method overrides the current assigned section
     *
     * @param ContentInfo $content
     * @param Section $section
     * @throws ezp\PublicAPI\Interfaces\ForbiddenException If user does not have access to view provided object
     */
    public function assignSection( /*ContentInfo*/ $content, /*Section*/ $section );

    /**
     * Assigns $section to the contents held by $startingPoint location and
     * all contents held by descendants locations of $startingPoint to which the user has
     * the permission to assign a section
     *
     * @param Location $startingPoint
     * @param Section $section
     * @return array  a list (string) of descendants which are not changed due to permissions
     * @throws ezp\PublicAPI\Interfaces\UnauthorizedException If the current user is not allowed to assign a section to this location
     *
     */
    public function assignSectionToSubtree( /*Location*/ $startingPoint, /*Section*/ $section );

    /**
     * Deletes $section from content repository
     *
     * @param Section $section
     * @return void
     * @throws ezp\PublicAPI\Interfaces\NotFoundException If the specified section is not found
     * @throws ezp\PublicAPI\Interfaces\UnauthorizedException If the current user user is not allowed to delete a section
     * @throws ezp\PublicAPI\Interfaces\ForbiddenException  if section can not be deleted
     *         because it is still assigned to some contents.
     */
    public function deleteSection( /*Section*/ $section );

}
?>

