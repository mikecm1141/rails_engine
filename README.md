[![Build Status](https://travis-ci.org/mikecm1141/rails_engine.svg?branch=master)](https://travis-ci.org/mikecm1141/rails_engine)
[![Test Coverage](https://img.shields.io/badge/coverage-100%25-green.svg)](https://codecov.io/gh/mikecm1141/rails_engine)
[![Ruby Version](https://img.shields.io/badge/ruby-2.5.1-red.svg)](https://img.shields.io/badge/ruby-2.5.1-red.svg)
[![Rails Version](https://img.shields.io/badge/rails-%3E%3D%205.2-red.svg)](https://img.shields.io/badge/rails-%3E%3D%205.2-red.svg)

# Rails Engine

## Introduction
This project uses provided sales data to provide a basic API for accessing that data. You can also run a variety of business intelligence queries against the database. Data is returned in the JSON format. Here are some sample requests:

### See a list of all merchants
Visiting `/api/v1/merchants/` returns:
```json
[
  { 
    "id":1,
    "name":"Schroeder-Jerde"
  },
  {
    "id":2,
    "name":"Klein, Rempel and Jones"
  },
  {
    "id":3,
    "name":"Willms and Sons"
   }
]
```

### Find a merchant by name
Visiting `/api/v1/merchants/find?name=Kozey%20Group` returns:
```json
{
  "id":12,
  "name":"Kozey Group"
}
```

### Find all items associated with a merchant
```json
[
  {
    "id":210,
    "name":"Item Aut Sit",
    "description":"Rerum eos sapiente repellendus cupiditate praesentium. Nulla sint quisquam corrupti autem. Sapiente unde doloremque non et sunt ipsa.",
    "unit_price":"244.29",
    "merchant_id":12
  },
  {
    "id":211,
    "name":"Item Commodi Eveniet",

    "description":"Et exercitationem quas et expedita enim laborum. Facere incidunt illum expedita praesentium. Sequi ut labore sint in.",
    "unit_price":"77.37",
    "merchant_id":12
  }
]
```

### Find total revenue for a merchant
Visiting `/api/v1/merchants/12/revenue` returns:
```json
{
  "revenue":"725116.93"
}
```

## Installation
To get started, run `bundle` from the command line in the root application directory.

## Database Creation
To setup the database for initialization, run `rake db:{create,migrate}` from the command line.

## Database Initialization
To import sales data from the provided CSV files, run `rake import:csv` from the command line. This process may take a few minutes.

## Running the Test Suite
To run the test suite, run `rspec` from the command line to run the full test suite. You can also run `rspec <path_to_spec_file>` from the command line to run just one test, or run `rspec spec/<models || requests>` from the command line to run either model tests OR request tests.
