namespace :spree_blogit do

  desc "Alias of blogit:css:compile"
  task :css => [:"css:compile"]

  namespace :css do

    desc "Compiles blogit sass files to css and .min.css"
    task :compile do
      system "sass -r sass-globbing --no-cache --quiet \
        --load-path=app/assets/stylesheets/spree/frontend/themes \
        app/assets/stylesheets/spree/frontend/themes/default.sass \
        app/assets/stylesheets/spree/frontend/themes/default.css"

      system "sass -r sass-globbing --no-cache --quiet --style=compressed \
        --load-path=app/assets/stylesheets/spree/frontend/themes \
        app/assets/stylesheets/spree/frontend/themes/default.sass \
        app/assets/stylesheets/spree/frontend/themes/default.min.css"
    end

  end
end
