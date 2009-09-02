namespace :patch do
  desc "Patch rails and gems using patch/rails"
  task :all => ["rails:patch", "gems:patch"]
end

namespace :rails do
  desc "Patch frozen rails using patch/rails"
  task :patch do
    # patch_paths = Dir.glob(File.join(RAILS_ROOT, "patch", "rails", "*.patch"))
    patch_paths = Dir.glob(Rails.root.join("patch", "rails", "*.patch").to_s)
    patch_paths.each do |patch_path|
      patch_name = File.split(patch_path).last
      rails_dir = Rails.root.join("vendor", "rails")
      puts "Applying #{patch_name} to rails"
      `patch -d #{rails_dir} -p1 < #{patch_path}`
    end
  end
end

namespace :gems do
  desc "Patch frozen gems using patch/gems"
  task :patch do
    patch_dirs = Dir.glob(Rails.root.join("patch", "gems", "*").to_s)
    patch_dirs.each do |patch_dir|
      gem_name = File.split(patch_dir).last
      gem_dir = Rails.root.join("vendor", "gems", gem_name)
      patch_paths = Dir.glob(Rails.root.join(patch_dir, "*.patch").to_s)
      patch_paths.each do |patch_path|
        patch_name = File.split(patch_path).last
        puts "Applying #{patch_name} to #{gem_name}"
        `patch -d #{gem_dir} -p1 < #{patch_path}`
      end
    end
  end
end
