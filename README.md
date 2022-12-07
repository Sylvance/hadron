# Hadron

Ruby framework called Hadron that allows you to work with gRPC Ruby output easily.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hadron

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hadron

## Usage

Once you have installed the gem, you can use it to create a new Ruby project by running the following command:

    $ hadron create my_project

This will create a new Ruby project called my_project that uses the Hadron framework. You can then add gRPC support to your project by including the grpc gem in your project's Gemfile and running bundle install to install the gem.

For example, your Gemfile might look like this:

```ruby
source 'https://rubygems.org'

gem 'hadron'
gem 'grpc'
```

Once you have added the grpc gem to your project, you can use it to work with gRPC output easily in your Ruby code. For example, you might use it to define a gRPC service and implement its methods, as shown in the following code snippet:

```ruby
class MyService < Hadron::Service
  rpc :say_hello, HelloRequest, HelloResponse

  def say_hello(request, _call)
    HelloResponse.new(message: "Hello, #{request.name}!")
  end
end
```

This code defines a gRPC service called `MyService` that has a single method called `say_hello`. This method takes a `HelloRequest` and returns a `HelloResponse` containing a greeting message.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Sylvance/hadron. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Sylvance/hadron/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Hadron project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Sylvance/hadron/blob/main/CODE_OF_CONDUCT.md).
