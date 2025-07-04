require_relative '../automated_init'

context "Parse Arguments" do
  context "Help" do
    {
      "Short Form" => ['-h'],
      "Long Form" => ['--help']
    }.each do |prose, arguments|
      context prose do
        parse_arguments = ParseArguments.new(arguments)

        begin
          parse_arguments.()
        rescue SystemExit => system_exit
        end

        test! "Exits successfully" do
          assert(system_exit&.status.zero?)
        end

        context "Written Text" do
          detail parse_arguments.writer.written_text

          test do
            assert(parse_arguments.writer.written?)
          end
        end
      end
    end
  end
end
