require_relative '../../automated_init'

context "Parse Arguments" do
  context "Require Next Argument" do
    context "No Remaining Arguments" do
      arguments = []
      parse_arguments = ParseArguments.new(arguments)

      test "Is an error" do
        assert_raises(ParseArguments::Error) do
          parse_arguments.require_next_argument('--some-switch')
        end
      end
    end
  end
end
