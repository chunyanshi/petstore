Feature: Pet
  In order to manage pet information
  As a storeowner
  I need to be able to add/update/delete pet details in PetStore

Scenario: Add a new pet with valid data
  Given the request body is: 
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  When I request "/pet" using HTTP POST
  Then the response code is 200
  And the response body is
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  And there is a new row in table pet in database with content
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """

Scenario: Add a new pet with mismatching datatype data
  Given the request body is: 
  """
  {
    "id": "ddd",
    "category": {
      "id": 0,
      "name": 123
    },
    "name": null,
    "photoUrls": [
      4246
    ],
    "tags": [
      {
        "id": 1badfg,
        "name": "string"
      }
    ],
    "status": "bbb"
  }
  """
  When I request "/pet" using HTTP POST
  Then the response code is 500
  And there is no new row in table pet in database

Scenario: Add a new pet with big data which exceed the datatype limit
  Given the request body is: 
  """
  {
    "id": 100223372036854775807,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  When I request "/pet" using HTTP POST
  Then the response code is 500
  And there is no new row in table pet in database

Scenario: Add a new pet with id of negative int value
  Given the request body is: 
  """
  {
    "id": -100223,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "Cat",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": -333,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  When I request "/pet" using HTTP POST
  Then the response code is 405
  And there is no new row in table pet in database

Scenario: Add a new pet with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request "/pet" using HTTP POST
  Then the response code is 400
  And there is no new row in table pet in database

Scenario: Add a new pet with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request "/pet" using HTTP POST
  Then the response code is 400
  And there is no new row in table pet in database

Scenario: Update an existing pet with valid data
  Given the request body is: 
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  When I request "/pet" using HTTP PUT
  Then the response code is 200
  And the response body is
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  And there is a updated row in table pet in database with content
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """

Scenario: Update an existing pet with mismatching datatype data
  Given the request body is: 
  """
  {
    "id": "ddd",
    "category": {
      "id": 0,
      "name": 123
    },
    "name": null,
    "photoUrls": [
      4246
    ],
    "tags": [
      {
        "id": 1badfg,
        "name": "string"
      }
    ],
    "status": "bbb"
  }
  """
  When I request "/pet" using HTTP PUT
  Then the response code is 500
  And the row for the existing pet is not changed in table pet in database

Scenario: Update an existing pet with big data which exceed the datatype limit
  Given the request body is: 
  """
  {
    "id": 100223372036854775807,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  When I request "/pet" using HTTP PUT
  Then the response code is 500
  And the row for the existing pet is not changed in table pet in database

Scenario: Update an existing pet with id of negative int value
  Given the request body is: 
  """
  {
    "id": -100223,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "Cat",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": -333,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  When I request "/pet" using HTTP PUT
  Then the response code is 405
  And the row for the existing pet is not changed in table pet in database

Scenario: Update an existing pet with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request "/pet" using HTTP PUT
  Then the response code is 400
  And the row for the existing pet is not changed in table pet in database

Scenario: Update an existing pet with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request "/pet" using HTTP PUT
  Then the response code is 400
  And the row for the existing pet is not changed in table pet in database

Scenario: Find pets by status with valid parameter and there are existing pets in database
  Given there are rows in table pet in database
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 2,
    "category": {
      "id": 3,
      "name": "string"
    },
    "name": "penguin",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "pending"
  }
  """
  Given the request body is: 
  """
  "available"
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 200
  And the response body is
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """

Scenario: Find pets by status with valid parameter and there is no existing pet in database
  Given there are rows in table pet in database
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """
  Given the request body is: 
  """
  "pending"
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 200
  And the response body is an empty JSON object

Scenario: Find pets by status with mismatching datatype parameter
  Given the request body is: 
  """
  112
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 500

Scenario: Find pets by status with invalid string
  Given the request body is: 
  """
  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 500


Scenario: Find pets by status with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 400


Scenario: Find pets by status with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 400

Scenario: Find pet by id with valid data
  Given there are rows in table pet in database
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 2,
    "category": {
      "id": 3,
      "name": "string"
    },
    "name": "penguin",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "pending"
  }
  """
  Given the request body is: 
  """
  1
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 200
  And the response body is
  """
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  """

Scenario: Find pet by id with valid parameter, but there is no matching row.
  Given there are rows in table pet in database
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 2,
    "category": {
      "id": 3,
      "name": "string"
    },
    "name": "penguin",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "pending"
  }
  """
  Given the request body is: 
  """
  5
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 404
  And the response body is an empty JSON object

Scenario: Find pet by id with mismatching datatype parameter
  Given the request body is: 
  """
  "dddd"
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 500

Scenario: Find pet by id with number outof the limit of int64
  Given the request body is: 
  """
  100223372036854775807
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 500


Scenario: Find pet by id with executable scripts
  Given the request body is: 
  """
  <?php echo "a"?>
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 400


Scenario: Find pet by id with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request "/pet/{petId}" using HTTP GET
  Then the response code is 400

Scenario: Update a pet in the store with valid form data
  Given there are rows in table pet in database
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 2,
    "category": {
      "id": 3,
      "name": "string"
    },
    "name": "penguin",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "pending"
  }
  """
  Given the following form parameters are set: 
    |petId  |name     |status   |
    |1      |"dingo"  |"pending"|
  When I request "/pet/{petId}" using HTTP POST
  Then the response code is 200
  And the response body is
  """
  {
    "id": 1,
    "name": "dingo",
    "status": "pending"
  }
  """
  And there is a updated row in table pet in database with content
  """
  {
    "id": 1,
    "name": "dingo",
    "status": "pending"
  }
  """

Scenario: Update a pet in the store with form data, but there is no matching row in database 
  Given the following form parameters are set: 
    |petId  |name     |status   |
    |"500"  |"dingo"  |"pending"|
  When I request "/pet/{petId}" using HTTP POST
  Then the response code is 404

Scenario: Update a pet in the store with mismatching datatype form data 
  Given the following form parameters are set: 
    |petId  |name     |status   |
    |"dd"   |"dingo"  |"pending"|
  When I request "/pet/{petId}" using HTTP POST
  Then the response code is 500

Scenario: Update a pet in the store with form data with big data which exceed the datatype limit
  Given the following form parameters are set: 
    |petId  |name     |status   |
    |100223372036854775807      |"abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn"  |"pending"|
  When I request "/pet/{petId}" using HTTP POST
  Then the response code is 500

Scenario: Update a pet in the store with form data with id of negative int value
  Given the following form parameters are set: 
    |petId  |name     |status   |
    |-333  |"dingo"  |"pending"|
  When I request "/pet/{petId}" using HTTP POST
  Then the response code is 405

Scenario: Update a pet in the store with form data with executable scripts
  Given the following form parameters are set: 
    |petId  |name     |status   |
    |-333  |"<?php echo "a"?>"  |"pending"|
  When I request "/pet/{petId}" using HTTP POST
  Then the response code is 400

Scenario: Update a pet in the store with form data with shell scripts(security test)
  Given the following form parameters are set: 
    |petId  |name     |status   |
    |-333  |"<?php exec("/bin/ls -l")?>"  |"pending"|
  When I request "/pet/{petId}" using HTTP POST
  Then the response code is 400

Scenario: Delete a pet with valid data
  Given there are rows in table pet in database
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 2,
    "category": {
      "id": 3,
      "name": "string"
    },
    "name": "penguin",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "pending"
  }
  """
  Given the request body is: 
  """
  {
    "api_key" : "valid api_key",
    "id": 1
  }
  """
  When I request "/pet/{petId}" using HTTP DELETE
  Then the response code is 200
  And there is no row for this pet in database

Scenario: Delete a pet with valid parameter, but there is no matching row.
  Given there are rows in table pet in database
  """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "doggie",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 1,
    "category": {
      "id": 2,
      "name": "string"
    },
    "name": "dingo",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
  {
    "id": 2,
    "category": {
      "id": 3,
      "name": "string"
    },
    "name": "penguin",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "pending"
  }
  """
  Given the request body is: 
  """
  {
    "api_key" : "valid api_key",
    "id": 5
  }
  """
  When I request "/pet/{petId}" using HTTP DELETE
  Then the response code is 404

Scenario: Delete a pet with invalid api_key
  Given the request body is: 
  """
  {
    "api_key" : "invalidapi_key",
    "id": "1"
  }
  """
  When I request "/pet/{petId}" using HTTP DELETE
  Then the response code is 500

Scenario: Delete a pet with mismatching datatype parameter
  Given the request body is: 
  """
  {
    "api_key" : "valid api_key",
    "id": "ddd"
  }
  """
  When I request "/pet/{petId}" using HTTP DELETE
  Then the response code is 500

Scenario: Delete a pet with number outof the limit of int64
  Given the request body is: 
  """
  {
    "api_key" : "valid api_key",
    "id": 100223372036854775807
  }
  """
  When I request "/pet/{petId}" using HTTP DELETE
  Then the response code is 500


Scenario: Delete a pet with executable scripts
  Given the request body is: 
  """
  {
    "api_key" : "valid api_key",
    "id": <?php echo "a"?>
  }
  """
  When I request "/pet/{petId}" using HTTP DELETE
  Then the response code is 400


Scenario: Delete a pet with shell scripts(security test)
  Given the request body is: 
  """
  {
    "api_key" : "valid api_key",
    "id": <?php exec("/bin/ls -l")?>
  }
  """
  When I request "/pet/{petId}" using HTTP DELETE
  Then the response code is 400

Scenario: upload and image with valid data
  Given the request body is: 
  """
  {
    "petId": 0,
    "additionalMetadata": "",
    "file": "/home/user1/picture/doggie.jpg"
  }
  """
  When I request "/pet/{petId}/uploadImage" using HTTP POST
  Then the response code is 200
  And the response body is
  """
  {
    "petId": 0,
    "additionalMetadata": "",
    "file": "/home/user1/picture/doggie.jpg"
  }
  """
  And there is a updated row in table pet in database with content
  """
  {
    "id": 0,
    "photoUrls": "$picture_path/doggie.jpg"
  }
  """

Scenario: upload and image with valid data, but there is no matching pet in database
  Given the request body is: 
  """
  {
    "petId": 2000000,
    "additionalMetadata": "",
    "file": "/home/user1/picture/doggie.jpg"
  }
  """
  When I request "/pet/{petId}/uploadImage" using HTTP POST
  Then the response code is 404


Scenario: upload and image with mismatching datatype data
  Given the request body is: 
  """
  {
    "petId": "ddd",
    "additionalMetadata": 111,
    "file": 333
  }
  """
  When I request "/pet/{petId}/uploadImage" using HTTP POST
  Then the response code is 404

Scenario: upload and image with big data which exceed the datatype limit
  Given the request body is: 
  """
  {
    "petId": 100223372036854775807,
    "additionalMetadata": "ddd",
    "file": "aaaa"
  }
  """
  When I request "/pet/{petId}/uploadImage" using HTTP POST
  Then the response code is 404

Scenario: upload and image with id of negative int value
  Given the request body is: 
  """
  {
    "petId": -11,
    "additionalMetadata": "ddd",
    "file": "aaaa"
  }
  """
  When I request "/pet/{petId}/uploadImage" using HTTP POST
  Then the response code is 404

Scenario: upload and image with executable scripts
  Given the request body is: 
  """
  {
    "petId": 1,
    "additionalMetadata": "<?php echo "a"?>",
    "file": "<?php echo "a"?>"
  }
  """
  When I request "/pet/{petId}/uploadImage" using HTTP POST
  Then the response code is 400
  And the row for the existing pet is not changed in table pet in database

Scenario: upload and image with shell scripts(security test)
  Given the request body is: 
  """
  <?php exec("/bin/ls -l")?>
  """
  When I request "/pet/{petId}/uploadImage" using HTTP POST
  Then the response code is 400
  And the row for the existing pet is not changed in table pet in database