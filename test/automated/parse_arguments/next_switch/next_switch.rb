require_relative '../../automated_init'

context "Parse Arguments" do
  context "Next Switch" do
    control_switch = '--next-switch'

    other_argument = 'some-argument'

    arguments = [other_argument, control_switch]
    comment "Arguments: #{arguments.join(' ')}"

    parse_arguments = ParseArguments.new(arguments)

    switch = parse_arguments.next_switch

    context "Switch" do
      comment switch.inspect
      detail "Control: #{control_switch}"

      test do
        assert(switch == control_switch)
      end
    end

    context "Remaining Arguments" do
      arguments = parse_arguments.arguments

      detail arguments.inspect

      test "Switch is removed" do
        refute(arguments.include?(control_switch))
      end

      test "Other argument isn't removed" do
        assert(arguments.include?(other_argument))
      end
    end
  end
end
