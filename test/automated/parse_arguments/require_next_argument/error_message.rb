require_relative '../../automated_init'

context "Parse Arguments" do
  context "Require Next Argument" do
    context "Error Message" do
      arguments = []
      parse_arguments = ParseArguments.new(arguments)

      control_switch = '--some-switch'

      test "Error message includes switch text" do
        assert_raises(ParseArguments::Error, "Switch #{control_switch} requires an argument") do
          parse_arguments.require_next_argument(control_switch)
        end
      end
    end
  end
end
