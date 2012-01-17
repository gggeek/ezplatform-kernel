<?php
/**
 * @package ezp\PublicAPI\Interfaces
 */
namespace ezp\PublicAPI\Interfaces;
/**
 * Language service, used for language operations
 * @package ezp\PublicAPI\Interfaces
 */
use ezp\PublicAPI\Values\Content\Language;

interface LanguageService
{
    /**
     * Creates the a new Language in the content repository
     *
     * @param string $languageCode
     * @param string $name
     * @param bool $isEnabled
     * @return Language
     * @throws ezp\Base\Exception\Unauthorized If user does not have access to content translations
     * @throws ezp\Base\Exception\Forbidden if the locale already exists
     */
    public function create( $languageCode, $name, $isEnabled = true );

    /**
     * Changes the name of the language in the content repository
     *
     * @param string $languageCode the unique indentifier of the language to be changed
     * @throws ezp\Base\Exception\Unauthorized If user does not have access to content translations
     */
    public function updateName($languageCode, $newName);

    /**
     * enables a language
     *
     * @param string $languageCode the unique indentifier of the language to be changed
     * @throws ezp\Base\Exception\Unauthorized If user does not have access to content translations
     */
    public function enable($languageCode);

    /**
     * disables a language
     *
     * @param string $languageCode the unique indentifier of the language to be changed
     * @throws ezp\Base\Exception\Unauthorized If user does not have access to content translations
     */
    public function disable($languageCode);

    /**
     * Loads a Language from its id ($languageId)
     *
     * @param int $languageId
     * @return Language
     * @throws \ezp\Base\Exception\NotFound if language could not be found
     */
    public function load( $languageId );

    /**
     * Loads all Languages
     *
     * @return array an aray of {@link Language}
     */
    public function loadAll();

    /**
     * Loads a Language by its languageCode ($localeCode)
     *
     * @param string $languageCode
     * @return Language
     * @throws \ezp\Base\Exception\NotFound if language could not be found
     */
    public function loadByLanguageCode( $languageCode );

    /**
     * Deletes  a language from content repository
     *
     * @param string $languageCode
     * @throws ezp\Base\Exception\Forbidden
     *         if language can not be deleted
     *         because it is still assigned to some content / type / (...).
     * @throws ezp\Base\Exception\Unauthorized If user does not have access to content translations
     */
    public function delete( $languageCode );

}
?>
