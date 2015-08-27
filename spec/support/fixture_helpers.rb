module FixtureHelpers
  def fixture(name)
    File.read(File.expand_path("../fixtures/#{name}", __FILE__))
  end

  module_function :fixture
end
