module MaintenanceModeSimple
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if maintenance_mode?
        [503, { 'Content-Type' => 'text/html' }, [maintenance_page]]
      else
        @app.call(env)
      end
    end

    private

    def maintenance_mode?
      File.exist?(Rails.root.join('tmp', 'maintenance.yml'))
    end

    def maintenance_page
      File.read(Rails.root.join('public', 'maintenance.html'))
    end
  end
end
