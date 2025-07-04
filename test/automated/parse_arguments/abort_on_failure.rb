require_relative '../automated_init'

context "Parse Arguments" do
  context "Abort on Failure" do
    context "Short Form" do
      parse_arguments = ParseArguments.new(['-a'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_ABORT_ON_FAILURE']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end

    context "Long Form" do
      parse_arguments = ParseArguments.new(['--abort-on-failure'])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_ABORT_ON_FAILURE']

      comment env_text.inspect

      test do
        assert(env_text == 'on')
      end
    end
  end
end
