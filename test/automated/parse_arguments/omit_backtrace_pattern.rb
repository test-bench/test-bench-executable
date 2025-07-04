require_relative '../automated_init'

context "Parse Arguments" do
  context "Omit Backtrace Pattern" do
    pattern_text = 'some-pattern'

    context "Short Form" do
      parse_arguments = ParseArguments.new(['-b', pattern_text])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OMIT_BACKTRACE_PATTERN']

      comment env_text.inspect

      test do
        assert(env_text == pattern_text)
      end
    end

    context "Long Form" do
      parse_arguments = ParseArguments.new(['--omit-backtrace', pattern_text])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OMIT_BACKTRACE_PATTERN']

      comment env_text.inspect

      test do
        assert(env_text == pattern_text)
      end
    end

    context "Multiple Patterns" do
      other_pattern_text = 'some-other-pattern'

      parse_arguments = ParseArguments.new(['-b', pattern_text, '-b', other_pattern_text])
      parse_arguments.()

      env_text = parse_arguments.env['TEST_BENCH_OMIT_BACKTRACE_PATTERN']
      control_env_text = "#{pattern_text}:#{other_pattern_text}"

      comment env_text.inspect
      detail "Control: #{control_env_text.inspect}"

      test do
        assert(env_text == control_env_text)
      end
    end

    context "No Value" do
      context "Final Argument" do
        parse_arguments = ParseArguments.new(['--omit-backtrace'])

        test "Is an error" do
          assert_raises(ParseArguments::Error) do
            parse_arguments.()
          end
        end
      end

      context "Next Argument Is An Option" do
        parse_arguments = ParseArguments.new(['--omit-backtrace', '-'])

        test "Is an error" do
          assert_raises(ParseArguments::Error) do
            parse_arguments.()
          end
        end
      end
    end
  end
end
