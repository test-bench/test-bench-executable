require_relative '../../automated_init'

context "Parse Arguments" do
  context "Next Switch" do
    context "No Next Switch" do
      control_argument = 'some-argument'

      arguments = [control_argument]
      comment "Arguments: #{arguments.join(' ')}"

      parse_arguments = ParseArguments.new(arguments)

      switch = parse_arguments.next_switch

      context "None" do
        detail switch.inspect

        test do
          assert(switch.nil?)
        end
      end

      context "Remaining Arguments" do
        arguments = parse_arguments.arguments

        detail arguments.inspect

        test "Other argument isn't removed" do
          assert(arguments.include?(control_argument))
        end
      end
    end
  end
end
