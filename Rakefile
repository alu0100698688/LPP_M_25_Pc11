require "bundler/gem_tasks"

task :default => :spec

desc "Ejecutar las espectativas de la clase Exam"
task :spec do
  sh "rspec -I. spec/exam_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/exam_spec.rb --format documentation"
end

desc "Construccion gema exam-0.0.1"
task :build do
  sh "bundle gem exam-0.0.1"
end

desc "Construir e instalar gema exam-0.0.1"
task :install do
  sh "bundle install"
end
