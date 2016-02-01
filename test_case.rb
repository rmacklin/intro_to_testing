class TestCase
  class AssertionFailure < StandardError; end

  def assert(result, message = nil)
    raise AssertionFailure.new(message || 'Failed assertion, no message given') unless result == true
  end

  def assert_equal(expected, actual, message = nil)
    assert (expected == actual), message || "Expected #{actual} to be #{expected}."
  end

  def assert_predicate(object, predicate, message = nil)
    assert object.send(predicate), message || "Expected #{object.inspect} to be #{predicate}."
  end

  def refute_predicate(object, predicate, message = nil)
    assert !object.send(predicate), message || "Expected #{object.inspect} to not be #{predicate}."
  end
end

at_exit do
  pass_count = 0
  fail_count = 0
  failures = []

  ObjectSpace.each_object(Class) do |klass|
    next if klass == TestCase || !klass.ancestors.include?(TestCase)

    test_methods = klass.instance_methods.select {|method_name| method_name =~ /^test_/}

    test_methods.each do |test_method_name|
      begin
        test_instance = klass.new
        test_instance.send(test_method_name.to_sym)
        pass_count += 1
        print "."
      rescue => e
        fail_count += 1
        failure_line = e.backtrace.find { |file| file !~ Regexp.new(__FILE__) }
        failures << "#{e.message}\n  #{klass.name}\##{test_method_name}, #{failure_line.scan(/^(.*):/).flatten.first}"
        print "F"
      end
    end
  end

  if failures.count > 0
    puts "\n\nFailed Tests:"
    puts failures
  end

  puts "\n#{pass_count} passed, #{fail_count} failed"
end
