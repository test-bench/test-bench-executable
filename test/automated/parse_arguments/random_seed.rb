require_relative '../automated_init'

context "Parse Arguments" do
  context "Random Seed" do
    context "Long Form" do
      seed = 'some-seed'

      parse_arguments = ParseArguments.new(['--random-seed', seed])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_RANDOM_SEED']

      comment env_text.inspect

      test do
        assert(env_text == seed)
      end
    end
  end
end
