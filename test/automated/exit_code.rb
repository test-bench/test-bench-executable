require_relative 'automated_init'

context "Exit Code" do
  context "Passed" do
    executable = Executable.new

    executable.run.set_result(true)

    exit_code = executable.()

    context "Exit Code" do
      comment exit_code.inspect

      test "Zero" do
        assert(exit_code.zero?)
      end
    end
  end

  context "Failed" do
    executable = Executable.new

    executable.run.set_result(false)

    exit_code = executable.()

    context "Exit Code" do
      comment exit_code.inspect

      test "Nonzero" do
        refute(exit_code.zero?)
      end
    end
  end
end
