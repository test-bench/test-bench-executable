require_relative '../automated_init'

context "Parse Arguments" do
  context "Output Styling" do
    context "Short Form" do
      parse_arguments = ParseArguments.new(['-o'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_STYLING']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end

    context "Short Form, Negated" do
      parse_arguments = ParseArguments.new(['-O'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_STYLING']

      comment env_text.inspect

      test do
        assert(env_text == 'off')
      end
    end

    context "Long Form" do
      parse_arguments = ParseArguments.new(['--output-styling'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_STYLING']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end

    context "Long Form, Negated" do
      parse_arguments = ParseArguments.new(['--no-output-styling'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_STYLING']

      comment env_text.inspect

      test do
        assert(env_text == 'off')
      end
    end
  end
end
