require_relative '../../automated_init'

context "Parse Arguments" do
  context "Require Next Argument" do
    context "Switch" do
      control_switch = '--next-switch'
      other_argument = 'some-argument'

      arguments = [control_switch, other_argument]
      comment "Arguments: #{arguments.join(' ')}"

      parse_arguments = ParseArguments.new(arguments)

      test "Is an error" do
        assert_raises(ParseArguments::Error) do
          parse_arguments.require_next_argument('--some-switch')
        end
      end
    end
  end
end
