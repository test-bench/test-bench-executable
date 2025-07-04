require_relative '../../automated_init'

context "Parse Arguments" do
  context "Next Argument" do
    context "Switch" do
      control_switch = '--next-switch'
      other_argument = 'some-argument'

      arguments = [control_switch, other_argument]
      comment "Arguments: #{arguments.join(' ')}"

      parse_arguments = ParseArguments.new(arguments)

      argument = parse_arguments.next_argument

      detail argument.inspect

      test! "No argument" do
        assert(argument.nil?)
      end

      context "Remaining Arguments" do
        arguments = parse_arguments.arguments

        detail arguments.inspect

        test "Switch isn't removed" do
          assert(arguments.include?(control_switch))
        end

        test "Argument after switch isn't removed" do
          assert(arguments.include?(other_argument))
        end
      end
    end
  end
end
