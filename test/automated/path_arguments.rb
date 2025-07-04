require_relative 'automated_init'

context "Path Arguments" do
  executable = Executable.new

  path = Controls::Path.example
  comment "Path: #{path.inspect}"

  other_path = Controls::Path.other_example
  comment "Path: #{other_path.inspect}"

  executable.arguments = [path, other_path]

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
