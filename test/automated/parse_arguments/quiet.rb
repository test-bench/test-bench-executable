require_relative '../automated_init'

context "Parse Arguments" do
  context "Quiet" do
    control_output_level = 'not-passing'

    context "Short Form" do
      parse_arguments = ParseArguments.new(['-q'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_LEVEL']

      comment env_text.inspect

      test do
        assert(env_text == control_output_level)
      end
    end

    context "Long Form" do
      parse_arguments = ParseArguments.new(['--quiet'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_LEVEL']

      comment env_text.inspect

      test do
        assert(env_text == control_output_level)
      end
    end
  end
end
