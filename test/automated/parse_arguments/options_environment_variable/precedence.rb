require_relative '../../automated_init'

context "Parse Arguments" do
  context "Options Environment Variable" do
    context "Precedence" do
      options = '--exclude some-pattern'

      env = {
        'TEST_BENCH_OPTIONS' => options
      }

      ParseArguments.(['--no-exclude'], env:)

      comment env.pretty_inspect

      precedence_correct = env['TEST_BENCH_EXCLUDE_FILE_PATTERN'].to_s.empty?

      test "Environment options are evaluated first" do
        assert(precedence_correct)
      end
    end
  end
end
