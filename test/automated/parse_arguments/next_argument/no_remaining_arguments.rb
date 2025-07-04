require_relative '../../automated_init'

context "Parse Arguments" do
  context "Next Argument" do
    context "No Remaining Arguments" do
      arguments = []
      comment "Arguments: #{arguments.join(' ')}"

      parse_arguments = ParseArguments.new(arguments)

      argument = parse_arguments.next_argument

      detail argument.inspect

      test "None" do
        assert(argument.nil?)
      end
    end
  end
end
