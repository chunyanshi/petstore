<?php

use Behat\Behat\Tester\Exception\PendingException;
use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Given the request body is:
     */
    public function theRequestBodyIs(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @When I request :arg1 using HTTP POST
     */
    public function iRequestUsingHttpPost($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then the response code is :arg1
     */
    public function theResponseCodeIs($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then the response body is
     */
    public function theResponseBodyIs(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Then there is a new row in table pet in database with content
     */
    public function thereIsANewRowInTablePetInDatabaseWithContent(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Then there is no new row in table pet in database
     */
    public function thereIsNoNewRowInTablePetInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @When I request :arg1 using HTTP PUT
     */
    public function iRequestUsingHttpPut($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then there is a updated row in table pet in database with content
     */
    public function thereIsAUpdatedRowInTablePetInDatabaseWithContent(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Then the row for the existing pet is not changed in table pet in database
     */
    public function theRowForTheExistingPetIsNotChangedInTablePetInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Given there are rows in table pet in database
     */
    public function thereAreRowsInTablePetInDatabase(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @When I request :arg1 using HTTP GET
     */
    public function iRequestUsingHttpGet($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then the response body is an empty JSON object
     */
    public function theResponseBodyIsAnEmptyJsonObject()
    {
        throw new PendingException();
    }

    /**
     * @Given the following form parameters are set:
     */
    public function theFollowingFormParametersAreSet(TableNode $table)
    {
        throw new PendingException();
    }

    /**
     * @When I request :arg1 using HTTP DELETE
     */
    public function iRequestUsingHttpDelete($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then there is no row for this pet in database
     */
    public function thereIsNoRowForThisPetInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Then the reponse body is
     */
    public function theReponseBodyIs(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Given there are no rows in table pet in database
     */
    public function thereAreNoRowsInTablePetInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Then there is a new row in table order in database with content
     */
    public function thereIsANewRowInTableOrderInDatabaseWithContent(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Then there is no new row in table order in database
     */
    public function thereIsNoNewRowInTableOrderInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Then the response body is EMPTY
     */
    public function theResponseBodyIsEmpty()
    {
        throw new PendingException();
    }

    /**
     * @Given there are rows in table order in database
     */
    public function thereAreRowsInTableOrderInDatabase(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Then there is no row for this order in database
     */
    public function thereIsNoRowForThisOrderInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Then there is a new row in table user in database with content
     */
    public function thereIsANewRowInTableUserInDatabaseWithContent(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Then there is no new row in table user in database
     */
    public function thereIsNoNewRowInTableUserInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Then there are new rows in table user in database with content
     */
    public function thereAreNewRowsInTableUserInDatabaseWithContent(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @When I request ​:arg1 using HTTP POST
     */
    public function iRequestUsingHttpPost2($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then there is no new row in table user in the database
     */
    public function thereIsNoNewRowInTableUserInTheDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Given I am authenticating as :username with password :password
     */
    public function iAmAuthenticatingAsUsernameWithPasswordPassword()
    {
        throw new PendingException();
    }

    /**
     * @Given There is no user :username in user table
     */
    public function thereIsNoUserUsernameInUserTable()
    {
        throw new PendingException();
    }

    /**
     * @Given :password is invalid for user :username
     */
    public function passwordIsInvalidForUserUsername()
    {
        throw new PendingException();
    }

    /**
     * @Given there is a row in ​table user in database
     */
    public function thereIsARowInTableUserInDatabase(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @When I request ​:arg1 using HTTP GET
     */
    public function iRequestUsingHttpGet2($arg1)
    {
        throw new PendingException();
    }

    /**
     * @When I request ​:arg1 using HTTP PUT
     */
    public function iRequestUsingHttpPut2($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then there is a updated row in ​table user in database with content
     */
    public function thereIsAUpdatedRowInTableUserInDatabaseWithContent(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @Then the row ​for the existing user is not changed in ​table user in database
     */
    public function theRowForTheExistingUserIsNotChangedInTableUserInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @Given there are rows in table user in database
     */
    public function thereAreRowsInTableUserInDatabase(PyStringNode $string)
    {
        throw new PendingException();
    }

    /**
     * @When I request ​:arg1 using HTTP DELETE
     */
    public function iRequestUsingHttpDelete2($arg1)
    {
        throw new PendingException();
    }

    /**
     * @Then there is no row ​for this user in database
     */
    public function thereIsNoRowForThisUserInDatabase()
    {
        throw new PendingException();
    }

    /**
     * @When I request "\/user\/{username}"using HTTP DELETE
     */
    public function iRequestUserUsernameUsingHttpDelete()
    {
        throw new PendingException();
    }
}
