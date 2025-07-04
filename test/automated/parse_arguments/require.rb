require_relative '../automated_init'

context "Parse Arguments" do
  context "Require" do
    apex_directory = Controls::Path::ApexDirectory::Create.()
    comment "Apex directory: #{apex_directory.inspect}"

    context "Short Form" do
      file_path = Controls::Path::File::Create.(apex_directory:)

      parse_arguments = ParseArguments.new(['-I', apex_directory,'-r', file_path])
      parse_arguments.()

      required = !!$LOADED_FEATURES.grep(file_path)

      test "Required" do
        assert(required)
      end

    ensure
      ::File.unlink(file_path) if !file_path.nil? && ::File.exist?(file_path)
    end

    context "Long Form" do
      file_path = Controls::Path::File::Create.(apex_directory:)

      parse_arguments = ParseArguments.new(['-I', apex_directory,'-r', file_path])
      parse_arguments.()

      required = !!$LOADED_FEATURES.grep(file_path)

      test "Required" do
        assert(required)
      end

    ensure
      Controls::Path::ApexDirectory::Remove.(apex_directory)
    end
  end
end
