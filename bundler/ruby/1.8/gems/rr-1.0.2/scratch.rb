o = Object.new
#p (class << o; self; end).singleton_methods
#p (class << o; self; end).superclass

klass = Class.new
p klass
p klass.superclass
p (class << klass; self; end).superclass
p (class << Class; self; end)

p Class.new

##any_instance_of(Person, :id => 111, :to_s => "Joe Smith")
##
##any_instance_of(Person) do |person|
##  person.id {111}
##  person.to_s {"Joe Smith"}
##end
##
##new_instance_of(Person, :id => 111, :to_s => "Joe Smith")
##new_instance_of(Person) do |person|
##  person.id {111}
##  person.to_s {"Joe Smith"}
##end
#
#class Sut
#  def existing_method
#    "existing_method"
#  end
#end
#
#class Dispatcher
#  def self.call(subject, method_name, *args, &block)
#    new(subject, method_name, *args, &block).call
#  end
#
#  attr_reader :method_name
#  def initialize(subject, method_name, *args, &block)
#    @subject, @method_name, @args, @block = subject, method_name, args, block
#  end
#
#  def call
#
#  end
#end
#
#Sut.class_eval do
#  alias_method :existing_method_without_rr, :existing_method
#
#  def existing_method(*args, &block)
#    Dispatcher.call(self, :existing_method, *args, &block)
#  end
#end

#class SubjectClass
#  def foo
#    :foo_original
#  end
#
#  def _dump(arg)
#    ""
#  end
#end
#subject = SubjectClass.new
#
#class << subject
#  p self.class
#  class << self
#    def foobar
#      :baz
#    end
#  end
#  p foobar
#end
#
#Foo = Module.new do
#  def foo
#    :foo_module
#  end
#end
#Bar = Module.new do
#  def foo
#    :bar_module
#  end
#end
##module Foo
##  def foo
##  end
##end
#
#subject.extend Foo
#end
#p subject.foo
#p Marshal.dump(subject)


class Super

end
class Sub < Super

end

def Super.foo
  :bar
end

def Sub.foo
  super
end

s = Super.new
p s.object_id
p (class << s; self; end).object_id
p s.class
#subject.extend Bar
#def subject.foo
#  :singleton_foo
