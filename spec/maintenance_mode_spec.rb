# frozen_string_literal: true

RSpec.describe MaintenanceMode do
  it "has a version number" do
    expect(MaintenanceMode::VERSION).not_to be nil
  end
end
