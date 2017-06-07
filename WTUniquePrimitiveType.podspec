Pod::Spec.new do |s|
  s.name             = 'WTUniquePrimitiveType'
  s.version          = '1.0.2'
  s.summary          = 'Lets you create distinct types based on identical primitive types.'
  s.description      = <<-DESC
    Say that your code has a user identifier that's an Int. The count of users
    is also an Int but, clearly, these are semantically different Ints. What if
    you accidentally set the value of userId to the count of users? The compiler
    wouldn't complain because both values are Int instances. This library lets
    you create distinct types for situations like this, where you need
    semantically different types based on the same primitive type. It works with
    all primitive types, not just Ints, and makes using these distinct types as
    easy and transparent as possible.
                       DESC
  s.homepage         = 'https://github.com/wltrup/Swift-WTUniquePrimitiveType'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wltrup' => 'trupwl@gmail.com' }
  s.source           = { :git => 'https://github.com/wltrup/Swift-WTUniquePrimitiveType.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'WTUniquePrimitiveType/Classes/**/*'
end
