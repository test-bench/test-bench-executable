require_relative 'automated_init'

context "Paths Specified Via Standard Input And Arguments" do
  executable = Executable.new

  path_argument = Controls::Path.example
  executable.arguments = [path_argument]

  stdin_path = Controls::Path.other_example
  stdin = Controls::StandardInput::Create.(stdin_path)
  executable.stdin = stdin

  executable.()

  context "Path Argument" do
    ran = executable.run.path?(path_argument)

    test "Ran" do
      assert(ran)
    end
  end

  context "Stdin Path" do
    ran = executable.run.path?(stdin_path)

    test "Ran" do
      assert(ran)
    end
  end
end
