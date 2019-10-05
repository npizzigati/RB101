require 'minitest/reporters'
require 'stringio'

# Minitest::Reporters.use!
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

module IoTestHelpers
  def simulate_stdin(*inputs, &block)
    io = StringIO.new
    inputs.flatten.each { |str| io.puts(str) }
    io.rewind
    actual_stdin, $stdin = $stdin, io
    yield
  ensure
    $stdin = actual_stdin
  end
end
