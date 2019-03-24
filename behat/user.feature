Feature: User
  In order to manage user information
  As a customer
  I need to be able to create user, log in, log out, get user information, update user information Then delete user.
  Or as store owner
  I need to be able to create users from input array or list.

Scenario: Create user with valid data
  Given the request body is: 
  """
  {
    "id": 0,
    "username": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  When I request "/user" using HTTP POST
  Then the response code is 200
  Then the response body is
  """
  {
    "id": 0,
    "username": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  Then there is a new row in table user in database with content
  """
  {
    "id": 0,
    "username": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """

Scenario: Create user with mismatching datatype data
  Given the request body is: 
  """
  {
    "id": "dd",
    "username": 332,
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  When I request "/user" using HTTP POST
  Then the response code is 500
  Then there is no new row in table user in database

Scenario: Create user with big data which exceed the datatype limit
  Given the request body is: 
  """
  {
    "id": 100223372036854775807,
    "username": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "firstName": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "lastName": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "email": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "password": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "phone": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "userStatus": "not correct"
  }
  """
  When I request "/user" using HTTP POST
  Then the response code is 500
  Then there is no new row in table user in database

Scenario: Create user with invalid status
  Given the request body is: 
  """
  {
    "id": 1,
    "username": "ccc",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": "invalid"
  }
  """
  When I request "/user" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create user with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request "/user" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create user with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request "/user" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create list of users with given input array with valid data
  Given the request body is: 
  """
  [
    {
      "id": 0,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
  ]
  """
  When I request "/user/createWithArray" using HTTP POST
  Then the response code is 200
  Then the response body is
  """
  [
    {
      "id": 0,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
  ]
  """
  Then there are new rows in table user in database with content
  """
  {
    "id": 0,
    "username": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
  }
  """

Scenario: Create list of users with given input array with mismatching datatype data
  Given the request body is: 
  """
  [
    {
      "id": "0",
      "username": 12,
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": 123445,
      "userStatus": "0"
    }
  ]
  """
  When I request "/user/createWithArray" using HTTP POST
  Then the response code is 500
  Then there is no new row in table user in database

Scenario: Create list of users with given input array with big data which exceed the datatype limit
  Given the request body is: 
  """
  [
    {
      "id": 100223372036854775807,
      "username": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "firstName": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "lastName": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "email": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "password": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "phone": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "userStatus": "not correct"
    }
  ]
  """
  When I request "/user/createWithArray" using HTTP POST
  Then the response code is 500
  Then there is no new row in table user in database

Scenario: Create list of users with given input array with invalid status
  Given the request body is: 
  """
  [
    {
      "id": 1,
      "username": "ccc",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": "invalid"
    }
  ]
  """
  When I request "/user/createWithArray" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create list of users with given input array with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request "/user/createWithArray" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create list of users with given input array with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request "/user/createWithArray" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create list of users with given input list with valid data
  Given the request body is: 
  """
  {
    {
      "id": 0,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
  }
  """
  When I request ​"/user​/createWithList" using HTTP POST
  Then the response code is 200
  Then the response body is
  """
  {
    {
      "id": 0,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
  }
  """
  Then there are new rows in table user in database with content
  """
  {
    "id": 0,
    "username": "string",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
  """

Scenario: Create list of users with given input list with mismatching datatype data
  Given the request body is: 
  """
  {
    {
      "id": "0",
      "username": 12,
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    {
      "id": 2,
      "username": "string",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": 123445,
      "userStatus": "0"
    }
  }
  """
  When I request ​"/user​/createWithList" using HTTP POST
  Then the response code is 500
  Then there is no new row in table user in the database

Scenario: Create list of users with given input list with big data which exceed the datatype limit
  Given the request body is: 
  """
  {
    {
      "id": 100223372036854775807,
      "username": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "firstName": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "lastName": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "email": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "password": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "phone": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
      "userStatus": "not correct"
    }
  }
  """
  When I request ​"/user​/createWithList" using HTTP POST
  Then the response code is 500
  Then there is no new row in table user in database

Scenario: Create list of users with given input list with invalid status
  Given the request body is: 
  """
  {
    {
      "id": 1,
      "username": "ccc",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": "invalid"
    }
  }
  """
  When I request ​"/user​/createWithList" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create list of users with given input list with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request ​"/user​/createWithList" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Create list of users with given input list with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request ​"/user​/createWithList" using HTTP POST
  Then the response code is 400
  Then there is no new row in table user in database

Scenario: Log user into the system with valid username and password
  Given I am authenticating as :username with password :password
  When I request "/user/login" using HTTP GET
  Then the response code is 200

Scenario: Log user into the system with invalid username
  Given There is no user :username in user table
  Given I am authenticating as :username with password :password
  When I request "/user/login" using HTTP GET
  Then the response code is 400

Scenario: Log user into the system with invalid password
  Given :password is invalid for user :username
  Given I am authenticating as :username with password :password
  When I request "/user/login" using HTTP GET
  Then the response code is 400

Scenario: Log out current logged in user session
  When I request "/user/logout" using HTTP GET
  Then the response code is 200

Scenario: ​Get user by user name with valid parameter and there is an existing user in database
  Given there is a row in ​table user in database
  """
  {
    "id": 0,
    "username": "user1",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  Given the request body is: 
  """
  "user1"
  """
  When I request ​"/user/{username}" using HTTP GET
  Then the response code is 200
  And the response body is
  """
  {
    "id": 0,
    "username": "user1",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """

Scenario: ​Get user by user name with valid parameter and there is no existing user in database
  Given there is a row in ​table user in database
  """
  {
    "id": 0,
    "username": "user1",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  Given the request body is: 
  """
  "nn"
  """
  When I request ​"/user/{username}" using HTTP GET
  Then the response code is 200
  And the response body is an empty JSON object

Scenario: ​Get user by user name with mismatching datatype parameter
  Given the request body is: 
  """
  112
  """
  When I request ​"/user/{username}" using HTTP GET
  Then the response code is 500

Scenario: ​Get user by user name with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request ​"/user/{username}" using HTTP GET
  Then the response code is 400


Scenario: ​Get user by user name with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request ​"/user/{username}" using HTTP GET
  Then the response code is 400

Scenario: ​Update user with valid data
  Given the request body is: 
  """
  {
    "id": 0,
    "username": "user1",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  When I request ​"/user/{username}" using HTTP PUT
  Then the response code is 200
  And the response body is
  """
  {
    "id": 0,
    "username": "user1",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  And there is a updated row in ​table user in database with content
  """
  {
    "id": 0,
    "username": "user1",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """


Scenario: ​Update user with mismatching datatype data
  Given the request body is: 
  """
  {
    "id": "d",
    "username": 11,
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  When I request ​"/user/{username}" using HTTP PUT
  Then the response code is 500
  And the row ​for the existing user is not changed in ​table user in database

Scenario: ​Update user with big data which exceed the datatype limit
  Given the request body is: 
  """
  {
    "id": 100223372036854775807,
    "username": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  When I request ​"/user/{username}" using HTTP PUT
  Then the response code is 500
  And the row ​for the existing user is not changed in ​table user in database

Scenario: ​Update user with id of negative int value
  Given the request body is: 
  """
  {
    "id": -333,
    "username": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "firstName": "string",
    "lastName": "string",
    "email": "string",
    "password": "string",
    "phone": "string",
    "userStatus": 0
  }
  """
  When I request ​"/user/{username}" using HTTP PUT
  Then the response code is 405
  And the row ​for the existing user is not changed in ​table user in database

Scenario: ​Update user with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request ​"/user/{username}" using HTTP PUT
  Then the response code is 400
  And the row ​for the existing user is not changed in ​table user in database

Scenario: ​Update user with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request ​"/user/{username}" using HTTP PUT
  Then the response code is 400
  And the row ​for the existing user is not changed in ​table user in database

Scenario: Delete user with valid data
  Given there are rows in table user in database
    """
    {
      "id": 0,
      "username": "user1",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    """
  Given the request body is: 
  """
  "user1"
  """
  When I request ​"/user/{username}" using HTTP DELETE
  Then the response code is 200
  And there is no row ​for this user in database

Scenario: Delete user with valid parameter, but there is no matching row.
  Given there are rows in table user in database
    """
    {
      "id": 0,
      "username": "user1",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    """
  Given the request body is: 
  """
  "user2"
  """
  When I request ​"/user/{username}" using HTTP DELETE
  Then the response code is 404

Scenario: Delete user with mismatching datatype parameter
  Given the request body is: 
  """
  123
  """
  When I request ​"/user/{username}" using HTTP DELETE
  Then the response code is 500

  Scenario: Delete user with long string 
  Given the request body is: 
  """
  "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn"
  """
  When I request "/user/{username}"using HTTP DELETE
  Then the response code is 500


Scenario: Delete user with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request ​"/user/{username}" using HTTP DELETE
  Then the response code is 400


Scenario: Delete user with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request ​"/user/{username}" using HTTP DELETE
  Then the response code is 400  