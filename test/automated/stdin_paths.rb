require_relative 'automated_init'

context "Paths Supplied By Standard Input" do
  executable = Executable.new

  path = Controls::Path.example
  comment "Path: #{path.inspect}"

  other_path = Controls::Path.other_example
  comment "Path: #{other_path.inspect}"

  stdin = Controls::StandardInput::Create.(path, other_path)
  executable.stdin = stdin

  executable.()

  context "Path" do
    ran = executable.run.path?(path)

    test "Ran" do
      assert(ran)
    end
  end

  context "Other Path" do
    ran = executable.run.path?(path)

    test "Ran" do
      assert(ran)
    end
  end
end
