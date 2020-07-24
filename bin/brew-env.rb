#!/usr/bin/env ruby
require 'keg'
require 'formula'
# require 'brew'

require 'irb'

module BrewEnv

  USAGE = <<-EOS
  DESCRIPTION Shell environment helper
  USAGE
    brew env [command]

    Where command is:

      recache # Recache the shell envronment script file
      source-file # Get the source file for the shell env
      shellenv # Output the shellenv directly (i.e. for debugigng) 

  EOS

  module_function

  def run
    if ['help'].include? ARGV.first
      puts USAGE
      exit 0
    end

    if ['recache'].include? ARGV.first
      puts "recaching"

      installed_formulas = Formula.installed
      first = installed_formulas.first
      brew_env = installed_formulas.find{|f| f.name == "homebrew-env"}
      installed_names = installed_formulas.map(&:name)
      
      presets_file = etc/'presets.yaml'
      presets = YAML.load(IO.read(presets_file)) 
      preset_names = presets.map{|p| p[:name] }

      with_presets = preset_names & installed_names
      env_scripts = with_presets.map{|preset| "\n\n\#\#\# #{preset}\n\n" +  presets.find{|a| a[:name] == preset}[:script]}

      env_output = env_scripts.join("")

      File.open(get_cache_file, 'w') do |f|
        f.write env_output
      end 
      puts "done"
    end

    if ['source-file'].include? ARGV.first
      puts get_cache_file.to_s
    end

    if ['shellenv'].include? ARGV.first
      puts IO.read(get_cache_file.to_s)    
    end

  end

  def etc
    homebrew_prefix/'etc/brew-env'
  end

  def homebrew_prefix
  Pathname.new ENV['HOMEBREW_PREFIX']
  end

  def get_cache_file
    homebrew_prefix.join('etc', 'brew-env', 'cache')
  end
end

BrewEnv.run
exit 0
