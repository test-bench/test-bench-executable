require_relative '../automated_init'

context "Parse Arguments" do
  arguments = ['some-argument', '--strict', '--', '--some-switch', 'some-other-argument']

  env = {}

  remaining_arguments = ParseArguments.(arguments, env:)

  context "Remaining Arguments" do
    control_arguments = ['some-argument', '--some-switch', 'some-other-argument']

    comment remaining_arguments.join(' ')
    detail "Control: #{control_arguments.join(' ')}"

    test do
      assert(remaining_arguments == control_arguments)
    end
  end
end
