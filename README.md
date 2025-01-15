# String Calculator
String Calculator: A versatile tool that adds numbers in a string, handling custom delimiters, edge cases, and more
## Table of Contents

1. [Introduction](#introduction)
2. [Dependencies](#dependencies)
3. [Features](#features)
4. [Method Signature](#method-signature)
5. [Usage](#usage)
6. [Implementation Details](#implementation-details)
7. [Error Handling](#error-handling)
8. [Testing](#testing)
9. [Contributing](#contributing)

## Introduction

The **String Calculator** is a simple utility designed to perform the **addition** of numbers presented in string format. The calculator supports various formats and delimiters, providing robust handling of common input scenarios. The core functionality of the calculator is the ability to add numbers that are passed as a string, and it also handles scenarios like custom delimiters, multiple delimiters, and edge cases like negative numbers or numbers greater than 1000.

## Dependencies

To set up the project, ensure the following dependencies are installed:

### Ruby
- Ruby version 3.3.0 is required. You can use `rbenv` or `rvm` to manage the Ruby version.
- The `.ruby-version` file in the project contains the required version of Ruby.

### Bundler
- Bundler is used to manage the project's gems and dependencies.
- Install Bundler by running the following command:
  ```ruby
  gem install bundler
  ```
### Gems
- The project uses rspec gem for testing purpose.
- Install all required gems by running:
  ```ruby
  bundle install
  ```
  This command will install the gems specified in the `Gemfile`.
## Features

- **Basic Addition**: Add up to two numbers separated by commas.
- **Multiple Numbers**: Support for an unknown number of numbers.
- **New Line as Delimiter**: Handle new lines as valid delimiters.
- **Custom Delimiters**: Allow custom single or multiple delimiters of any length.
- **Negative Number Validation**: Detect and raise exceptions for negative numbers.
- **Ignore Large Numbers**: Ignore numbers larger than 1000 in the sum calculation.


## Method Signature
The add method takes a single argument, str, which is a string containing numbers. The numbers are separated by delimiters, and the method returns the sum of the numbers.

## Usage
Here are some examples of how to use the String Calculator:

```ruby
# Adding an empty string returns 0
StringCalculator.add('') # => 0

# Adding a single number
StringCalculator.add('1') # => 1

# Adding multiple numbers
StringCalculator.add('1,2') # => 3

# Handling new lines between numbers
StringCalculator.add("1\n2,3") # => 6

# Custom delimiter
StringCalculator.add("//;\n1;2") # => 3

# Handling large numbers (numbers greater than 1000 are ignored)
StringCalculator.add('1001,2') # => 2

# Handling multiple delimiters
StringCalculator.add("//[*][%]\n1*2%3") # => 6
```

## Implementation Details
The add method handles different delimiters by parsing the input string to identify the delimiter(s) used. The method also checks for negative numbers and raises an exception with a detailed error message.

### Steps involved:
1. Delimiter Parsing: If the string starts with //, the next line defines the delimiter(s).
2. Extracting Digits: The method extracts numbers by splitting the string based on the delimiters.
3. Negative Number Validation: It checks if any negative numbers are present and raises an exception if found.
4. Sum Calculation: It calculates the sum of numbers, ignoring any number greater than 1000.

## Error Handling
### Negative Numbers: 
If a negative number is encountered in the input string, the method raises an exception with the message `negatives not allowed: [negative_numbers]`
Example:
```ruby
StringCalculator.add('-1') # Raises error: "negatives not allowed: -1"
```
Multiple negative numbers:
```ruby
StringCalculator.add('-1,2,-3') # Raises error: "negatives not allowed: -1, -3"
```
## Testing
For testing, we use RSpec. It is installed as part of the dependencies.

### Running Tests
To execute the test cases, use the following command:
```ruby
bundle exec rspec
```
### output
```ruby
StringCalculator
  .add
    returns 0 for an empty string
    ignores numbers greater than 1000
    when the input is a single number
      returns 0 when the string contains 0
      returns 32 when the string contains 32
      returns 1000 when the string contains 1000
    when there are multiple numbers
      returns 3 when the string contains 1 and 2
      returns 10 when the string contains 4 and 6
      returns 15 when the string contains 1, 2, 3, 4, and 5
    when there is new line between numbers
      returns 6 when the string contains 1\n2,3
      returns 6 when the string contains 1\n2\n3
      returns 15 when the string contains 1,2\n3,4,5
    when there is a custom delimiter
      returns 3 when the string contains //;\n1;2
      returns 6 when the string contains //;\n1;2\n3
      returns 6 when the string contains //:\n1:2:3
      returns 6 when the string contains //:\n1:2\n3
    when there are negative numbers
      raises an exception when the string contains -1
      raises an exception when the string contains -1, 2, -3
    when there is a custom delimiter of any length
      when single delimiter
        returns 6 when the string contains //[***]1***2***3
      when multiple delimiters
        returns 6 when the string contains //[*][%]1*2%3
        returns 12 when the string contains //[**][%%]\n3**4%%5
        returns 6 when the string contains //[**][%%][!!]\n1**2%%3!!4
```

## Contributing
If you would like to contribute to the project, please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Write tests for your changes.
5. Submit a pull request with a detailed explanation of the changes.
