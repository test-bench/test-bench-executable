require_relative '../automated_init'

context "Parse Arguments" do
  context "Detail" do
    context "Short Form" do
      parse_arguments = ParseArguments.new(['-d'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_DETAIL']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end

    context "Short Form, Negated" do
      parse_arguments = ParseArguments.new(['-D'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_DETAIL']

      comment env_text.inspect

      test do
        assert(env_text == 'off')
      end
    end

    context "Long Form" do
      parse_arguments = ParseArguments.new(['--detail'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_DETAIL']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end

    context "Long Form, Negated" do
      parse_arguments = ParseArguments.new(['--no-detail'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OUTPUT_DETAIL']

      comment env_text.inspect

      test do
        assert(env_text == 'off')
      end
    end
  end
end
