require_relative '../automated_init'

context "Parse Arguments" do
  context "Incorrect Switch" do
    incorrect_switch = '--some-incorrect-switch'

    context "No Switch Terminator" do
      parse_arguments = ParseArguments.new([incorrect_switch])

      test "Is an error" do
        assert_raises(ParseArguments::Error) do
          parse_arguments.()
        end
      end
    end

    context "Before Switch Terminator" do
      parse_arguments = ParseArguments.new([incorrect_switch, '--'])

      test "Is an error" do
        assert_raises(ParseArguments::Error) do
          parse_arguments.()
        end
      end
    end

    context "After Switch Terminator" do
      parse_arguments = ParseArguments.new(['--', incorrect_switch])

      test "Isn't an error" do
        refute_raises(ParseArguments::Error) do
          parse_arguments.()
        end
      end
    end
  end
end
