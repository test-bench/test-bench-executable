require_relative '../automated_init'

context "Parse Arguments" do
  context "No Summary" do
    parse_arguments = ParseArguments.new(['--no-summary'])
    parse_arguments.()

    env_text = parse_arguments.env['TEST_BENCH_OUTPUT_SUMMARY']

    comment env_text.inspect

    test do
      assert(env_text == 'off')
    end
  end
end
