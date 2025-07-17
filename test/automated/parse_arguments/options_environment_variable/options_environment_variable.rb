require_relative '../../automated_init'

context "Parse Arguments" do
  context "Options Environment Variable" do
    options = '--abort-on-failure --exclude some-pattern'

    env = {
      'TEST_BENCH_OPTIONS' => options
    }

    ParseArguments.([], env:)

    control_env = {
      'TEST_BENCH_OPTIONS' => options,
      'TEST_BENCH_ABORT_ON_FAILURE' => 'on',
      'TEST_BENCH_EXCLUDE_FILE_PATTERN' => 'some-pattern'
    }

    comment env.pretty_inspect
    detail "Control:", control_env.pretty_inspect

    test do
      assert(env == control_env)
    end
  end
end
