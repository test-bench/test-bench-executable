require_relative '../../automated_init'

context "Parse Arguments" do
  context "Next Argument" do
    context "Not Switch" do
      control_argument = 'some-argument'
      other_argument = 'some-other-argument'

      arguments = [control_argument, other_argument]
      comment "Arguments: #{arguments.join(' ')}"

      parse_arguments = ParseArguments.new(arguments)

      argument = parse_arguments.next_argument

      comment argument.inspect
      detail "Control: #{control_argument.inspect}"

      test! do
        assert(argument == control_argument)
      end

      context "Remaining Arguments" do
        arguments = parse_arguments.arguments

        detail arguments.inspect

        test "Argument is removed" do
          refute(arguments.include?(control_argument))
        end

        test "Other argument isn't removed" do
          assert(arguments.include?(other_argument))
        end
      end
    end
  end
end
