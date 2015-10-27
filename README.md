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

1. Clone / fork this repo
2. `cd active_resource`
3. `bundle`
4. `RAILS_ENV=test bundle exec rake db:create_user db:setup`
5. `bundle exec rspec`

Note that the tests pass. We're not going to be modifying the
application code, but instead modifying our tests.

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

## Part 3: `Let` it be

Check out the specs for the `Address` model. There is a `before` block
at the top, which creates all of our variables for us. How convenient!

Unfortunately, `before` has some downsides - namely that it runs before
__every__ test. Do you need each of those variables in every test? If
not, perhaps you should consider a different rspec structure. __hint:
check out the section title__

## Part 4: Factories, in more depth

You cut down the runtime in the addres_spec by using lazy-evaluated
`let`s. But did you think about make it less verbose? We can put factory
girl to work here: check out [factory girl
traits](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#traits)
and think about how you could leverage them in address_spec.


We frequently test models that have_many associated models. While
it's not immediately obvious, we can create these releations
We can create [transient
traits](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#transient-attributes)
on an object, which mean they're available within the factory definition
only. Using these transient traits alongside
[callbacks](https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md#callbacks)
gives us the power to dynamically mimic the `has_and_belongs_to_many`
relationship. Come up with a solution, and see how much you can dry up
the code in `user_spec`.


If you're a little stuck on this last one (and an enova employee) you
can check out some pretty cool factory work
[here](https://git.enova.com/onstride/onstride/pull/243/files#diff-8707c1369e4c39b144680ea3ee173894R1)
