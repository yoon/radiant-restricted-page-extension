namespace :radiant do
  namespace :extensions do
    namespace :restricted_page do
      
      desc "Runs the migration of the Restricted Page extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          RestrictedPageExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          RestrictedPageExtension.migrator.migrate
        end
      end
    
    end
  end
end