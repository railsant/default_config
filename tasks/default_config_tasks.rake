Dir["#{RAILS_ROOT}/config/**/*.example"].collect{ |f| f.gsub('.example', '') }.each do |f|
  file "#{f}.example" do |task|
    abort "I don't know what to tell you, dude. There's no #{task.name}. So maybe you should make one of those, and see where that gets you."
  end
  file f => "#{f}.example" do |task|
    puts "I found #{task.prerequisites.first}, so I'll make a copy of it for you."
    cp task.prerequisites.first, task.name
  end
  task :environment => f
end