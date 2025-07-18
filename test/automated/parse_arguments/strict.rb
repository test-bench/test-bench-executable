require_relative '../automated_init'

context "Parse Arguments" do
  context "Strict" do
    context "Short Form" do
      parse_arguments = ParseArguments.new(['-s'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_STRICT']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end

    context "Short Form, Negated" do
      parse_arguments = ParseArguments.new(['-S'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_STRICT']

      comment env_text.inspect

      test do
        assert(env_text == 'off')
      end
    end

    context "Long Form" do
      parse_arguments = ParseArguments.new(['--strict'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_STRICT']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end

    context "Long Form, Negated" do
      parse_arguments = ParseArguments.new(['--no-strict'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_STRICT']

      comment env_text.inspect

      test do
        assert(env_text == 'off')
      end
    end
  end
end
