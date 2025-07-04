require_relative '../automated_init'

context "Parse Arguments" do
  context "Device" do
    context "Long Form" do
      device = 'some-device'

      parse_arguments = ParseArguments.new(['--device', device])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_DEVICE']

      comment env_text.inspect

      test do
        assert(env_text == device)
      end
    end

    context "No Value" do
      context "Final Argument" do
        parse_arguments = ParseArguments.new(['--device'])

        test "Is an error" do
          assert_raises(ParseArguments::Error) do
            parse_arguments.()
          end
        end
      end

      context "Next Argument Is An Option" do
        parse_arguments = ParseArguments.new(['--device', '-'])

        test "Is an error" do
          assert_raises(ParseArguments::Error) do
            parse_arguments.()
          end
        end
      end
    end
  end
end
