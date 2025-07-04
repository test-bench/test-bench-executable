require_relative '../../automated_init'

context "Parse Arguments" do
  context "Require Next Argument" do
    context "Not Switch" do
      control_argument = 'some-argument'

      arguments = [control_argument]
      comment "Arguments: #{arguments.join(' ')}"

      parse_arguments = ParseArguments.new(arguments)

      argument = parse_arguments.require_next_argument('--some-switch')

      comment argument.inspect
      detail "Control: #{control_argument.inspect}"

      test! do
        assert(argument == control_argument)
      end
    end
  end
end
