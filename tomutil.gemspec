
Gem::Specification.new do |s|
	s.name = "tomutil"
	s.version = "1.1.0"

	s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
	s.authors = ["Tom Santos"]
	s.date = "2010-11-08"
	s.description = "A gem of random utils that I use"
	s.summary = "A gem of random utils that I use"
	s.email = "santos.tom@gmail.com"
	s.files = %w[
        README
        lib/tomutil/parallel.rb
        lib/tomutil/padder.rb
    ]
	s.homepage = "http://github.com/tsantos/tomutil"
	s.rubygems_version = "1.3.0"
end
