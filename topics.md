Basics:

- TDD
- test coverage (and adding tests when you find a bug even though all your tests are passing)
- How a test is actually run: Build your own (very basic) test runner
- assert_predicate, refute_predicate
- assert_difference

Rails:

- controller tests should always make an assertion about the response status
- use xhr in a controller test if the action is hit via xhr in practice
- assert_select (specifically the cool stuff you can do when you pass it a block)
