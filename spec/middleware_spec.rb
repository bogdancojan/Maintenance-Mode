# frozen_string_literal: true

require "maintenance_mode_simple/middleware"

RSpec.describe MaintenanceModeSimple::Middleware do
  let(:app) { ->(env) { [200, { "Content-Type" => "text/plain" }, ["OK"]] } }
  let(:middleware) { described_class.new(app) }
  let(:env) { {} }

  before do
    allow(middleware).to receive(:maintenance_mode?).and_return(false)
    allow(middleware).to receive(:maintenance_page).and_return("Maintenance Page")
  end

  context "when maintenance mode is enabled" do
    before do
      allow(middleware).to receive(:maintenance_mode?).and_return(true)
    end

    it "returns a 503 status with the maintenance page" do
      status, headers, body = middleware.call(env)
      expect(status).to eq(503)
      expect(headers["Content-Type"]).to eq("text/html")
      expect(body).to eq(["Maintenance Page"])
    end
  end

  context "when maintenance mode is disabled" do
    it "calls the app and returns a 200 status" do
      status, headers, body = middleware.call(env)
      expect(status).to eq(200)
      expect(headers["Content-Type"]).to eq("text/plain")
      expect(body).to eq(["OK"])
    end
  end
end
