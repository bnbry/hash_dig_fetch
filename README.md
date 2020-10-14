# HashDigFetch

```ruby

class SomeCoolObject
  using HashDigFetch

  NESTED_HASH = {
    my: {
      deeply: {
        nested: {
          structure: "you found me!"
        }
      }
    }
  }

  def do_work
    puts NESTED_HASH.dig_fetch(:my, :deeply, :nested, :structure, "uh oh!")
    # => "you found me!"
    puts NESTED_HASH.dig_fetch(:my, :deeply, :nested, :missing_key, "uh oh!")
    # => "oh no!"
    puts NESTED_HASH.dig_fetch(:my, :deeply, :nested, :structure) { "oh no!" }
    # => "you found me!"
    puts NESTED_HASH.dig_fetch(:my, :deeply, :nested, :missing_key) { "oh no!" }
    # => "oh no!"
  end
end

```

## Installation

Just steal the code, you don't need the dependency and I haven't published it yet.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
