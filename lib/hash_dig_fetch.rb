require "hash_dig_fetch/version"

module HashDigFetch
  refine Hash do
    def dig_fetch(*args, &block)
      # If we have a block, all the arguments are for traversing the hash, if not then the last argument
      # is the fallback value for a failed fetch
      if block_given?
        # flip the args to isolate the last argument from the depth chain
        last, *depth = *args.reverse
        # flip them back to dig to the proper depth then fetch and pass the block along
        dig(*depth.reverse).fetch(last, &block)
      else
        # flip the args to isolate the last two arguments from the depth chain
        fallback, last, *depth = *args.reverse
        # flip them back to dig to the proper depth then fetch and pass the fallback along
        dig(*depth.reverse).fetch(last, fallback)
      end
    # if dig resulted in nil, fetch method will fail in which case we want to execute the block or return fallback
    rescue NoMethodError
      block_given? ? block : fallback
    end
  end
end
