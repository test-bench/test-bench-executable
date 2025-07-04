require_relative '../automated_init'

context "Parse Arguments" do
  context "Ouptut Level" do
    output_level = 'some-level'

    context "Short Form" do
      parse_arguments = ParseArguments.new(['-l', output_level])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_LEVEL']

      comment env_text.inspect

      test do
        assert(env_text == output_level)
      end
    end

    context "Long Form" do
      parse_arguments = ParseArguments.new(['--output-level', output_level])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_LEVEL']

      comment env_text.inspect

      test do
        assert(env_text == output_level)
      end
    end

    context "No Value" do
      context "Final Argument" do
        parse_arguments = ParseArguments.new(['--output-level'])

        test "Is an error" do
          assert_raises(ParseArguments::Error) do
            parse_arguments.()
          end
        end
      end

      context "Next Argument Is An Option" do
        parse_arguments = ParseArguments.new(['--output-level', '-'])

        test "Is an error" do
          assert_raises(ParseArguments::Error) do
            parse_arguments.()
          end
        end
      end
    end
  end
end
