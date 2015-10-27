## Intermediate rails testing

You (hopefully) have some experience with [rspec for
rails](https://github.com/rspec/rspec-rails). You can probably use it
proficiently. But perhaps you don't know all the functions that rspec
provides to DRY up your tests & stub dependencies. The same can be said
about [factory girl](https://github.com/thoughtbot/factory_girl). This
lesson is intended for you to get a slightly deeper familiarity with the
two.

## Getting started
We'll be using the
[active_resource](https://github.com/schepedw/active_resource) repo that
we've used for a few previous lessons.
1. Clone / fork
   [active_resource](https://github.com/schepedw/active_resource)
2. `cd active_resource`
3. `bundle`
4. `RAILS_ENV=test bundle exec rake db:create_user db:setup`
5. `bundle exec rspec`

Note that the tests pass. We're not going to be modifying the
application code (much), but instead modifying our tests. 

## Part 1: Shared Examples
Frequently, our specs test the same thing, with only a minor variation
in the object under test. Our controller specs are an excellent example
of this. Check out [rspec shared
examples](https://www.relishapp.com/rspec/rspec-core/docs/example-groups/shared-examples)
and DRY them out!

## Part 2: Stubbing and factories
Hopefully you read through all the `create`s in those controller tests
and cringed a little. Thankfully, we can get rid of database
dependencies. Check out [rspec
stubbing](http://www.relishapp.com/rspec/rspec-mocks/v/2-99/docs/method-stubs)
and [FactoryGirl](https://github.com/thoughtbot/factory_girl). 

## Part 3: Factories, in more depth

We frequently test models that have_many associated models. #TODO:
continue thinking about explaining a has_many and a
has_and_belongs_to_many relationship. Many <-> is already implemented
between users & addresses
