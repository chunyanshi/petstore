Feature: Store
  In order to manage store information
  As a customer or petstore owner
  I need to be able to know the inventories of petstore, place orders, find orders and delete orders

Scenario: Returns pet inventories by status and there are pet records in database
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
	When I request "/store/inventory" using HTTP GET
	Then the response code is 200
	And the reponse body is
	"""
	{
	  "Avalible": 1,
	  "pending": 1
	}
	"""

Scenario: Returns pet inventories by status and there are no pet records in database
	Given there are no rows in table pet in database
	When I request "/store/inventory" using HTTP GET
	Then the response code is 404
	And the response body is an empty JSON object

Scenario: Place an order for a pet with valid data
	Given the request body is: 
	"""
	{
	  "id": 0,
	  "petId": 0,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	When I request "/store/order" using HTTP POST
	Then the response code is 200
	And the response body is
	"""
	{
	  "id": 0,
	  "petId": 0,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	And there is a new row in table order in database with content
	"""
	{
	  "id": 0,
	  "petId": 0,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""

Scenario: Place an order for a pet with invalid petID
	Given the request body is: 
	"""
	{
	  "id": 0,
	  "petId": 44444,
	  "quantity": 1,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	When I request "/store/order" using HTTP POST
	Then the response code is 404
	And there is no new row in table order in database


Scenario: Place an order for a pet with mismatching datatype data
	Given the request body is: 
	"""
	{
	  "id": "dd",
	  "petId": "aa",
	  "quantity": 1,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	When I request "/store/order" using HTTP POST
	Then the response code is 500
	And there is no new row in table order in database

Scenario: Place an order for a pet with big data which exceed the datatype limit
	Given the request body is: 
	"""
	{
	  "id": 100223372036854775807,
	  "petId": 1,
	  "quantity": 1,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "abcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmnabcdefghigklmn",
	  "complete": false
	}
	"""
	When I request "/store/order" using HTTP POST
	Then the response code is 500
	And there is no new row in table order in database

Scenario: Place an order for a pet with invalid status
	Given the request body is: 
	"""
	{
	  "id": 0,
	  "petId": 1,
	  "quantity": 1,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "invalidstatus",
	  "complete": true
	}
	"""
	When I request "/store/order" using HTTP POST
	Then the response code is 400
	And there is no new row in table order in database

Scenario: Place an order for a pet with executable scripts
	Given the request body is: 
	"""
	<?php echo "a"?>
	"""
	When I request "/store/order" using HTTP POST
	Then the response code is 400
	And there is no new row in table order in database

Scenario: Place an order for a pet with shell scripts(security test)
	Given the request body is: 
	"""
	<?php exec("/bin/ls -l")?>
	"""
	When I request "/store/order" using HTTP POST
	Then the response code is 400
	And there is no new row in table order in database

Scenario: Find purchase order by ID with valid data
	Given there are rows in table pet in database
	"""
	{
	  "id": 0,
	  "petId": 0,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	{
	  "id": 1,
	  "petId": 2,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": true
	}
	{
	  "id": 2,
	  "petId": 4,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	Given the request body is: 
	"""
	1
	"""
	When I request "/store/order/{orderId}" using HTTP GET
	Then the response code is 200
	And the response body is
	"""
	{
	  "id": 1,
	  "petId": 2,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": true
	}
	"""

Scenario: Find purchase order by ID with valid parameter, but there is no matching row.
	Given there are rows in table pet in database
	"""
	{
	  "id": 0,
	  "petId": 0,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	{
	  "id": 1,
	  "petId": 2,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": true
	}
	{
	  "id": 2,
	  "petId": 4,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	Given the request body is: 
	"""
	5
	"""
	When I request "/store/order/{orderId}" using HTTP GET
	Then the response code is 404
	And the response body is EMPTY

Scenario: Find purchase order by ID with mismatching datatype parameter
	Given the request body is: 
	"""
	"dddd"
	"""
	When I request "/store/order/{orderId}" using HTTP GET
	Then the response code is 500

Scenario: Find purchase order by ID with number outof the limit of int64
	Given the request body is: 
	"""
	100223372036854775807
	"""
	When I request "/store/order/{orderId}" using HTTP GET
	Then the response code is 500


Scenario: Find purchase order by ID with executable scripts
	Given the request body is: 
	"""
	<?php echo "a"?>
	"""
	When I request "/store/order/{orderId}" using HTTP GET
	Then the response code is 400

Scenario: Find purchase order by ID with shell scripts(security test)
	Given the request body is: 
	"""
	<?php exec("/bin/ls -l")?>
	"""
	When I request "/store/order/{orderId}" using HTTP GET
	Then the response code is 400

Scenario: Delete purchase order by ID with valid data
	Given there are rows in table order in database
	"""
	{
	  "id": 0,
	  "petId": 0,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	{
	  "id": 1,
	  "petId": 2,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": true
	}
	{
	  "id": 2,
	  "petId": 4,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	Given the request body is: 
	"""
	1
	"""
	When I request "/store/order/{orderId}" using HTTP DELETE
	Then the response code is 200
	And there is no row for this order in database

Scenario: Delete purchase order by ID with valid parameter, but there is no matching row.
	Given there are rows in table order in database
	"""
	{
	  "id": 0,
	  "petId": 0,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	{
	  "id": 1,
	  "petId": 2,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": true
	}
	{
	  "id": 2,
	  "petId": 4,
	  "quantity": 0,
	  "shipDate": "2019-03-24T06:49:34.531Z",
	  "status": "placed",
	  "complete": false
	}
	"""
	Given the request body is: 
	"""
	5
	"""
	When I request "/store/order/{orderId}" using HTTP DELETE
	Then the response code is 404

Scenario: Delete purchase order by ID with invalid api_key
	Given the request body is: 
	"""
	{
	  "api_key" : "invalidapi_key",
	  "id": "1"
	}
	"""
	When I request "/store/order/{orderId}" using HTTP DELETE
	Then the response code is 500

Scenario: Delete purchase order by ID with mismatching datatype parameter
	Given the request body is: 
	"""
	"ddd"
	"""
	When I request "/store/order/{orderId}" using HTTP DELETE
	Then the response code is 500

Scenario: Delete purchase order by ID with number outof the limit of int64
	Given the request body is: 
	"""
	100223372036854775807
	"""
	When I request "/store/order/{orderId}" using HTTP DELETE
	Then the response code is 500

Scenario: Delete purchase order by ID with executable scripts
	Given the request body is: 
	"""
	<?php echo "a"?>
	"""
	When I request "/store/order/{orderId}" using HTTP DELETE
	Then the response code is 400


Scenario: Delete purchase order by ID with shell scripts(security test)
	Given the request body is: 
	"""
	<?php exec("/bin/ls -l")?>
	"""
	When I request "/store/order/{orderId}" using HTTP DELETE
	Then the response code is 400