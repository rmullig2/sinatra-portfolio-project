require './config/environment'

use Rack::Static, :urls => ['/css', "/images"], :root => 'app/views' # Rack fix allows seeing the css folder.

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use AdminController
use PredictionController
use TeamController
use UserController
run ApplicationController