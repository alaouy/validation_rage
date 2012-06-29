require "test_helper"

class ValidationRage::BaseNotifierTest < MiniTest::Unit::TestCase
  
  def test_call_raises_a_not_implemented_error
    assert_raises(ValidationRage::BaseNotifier::NotImplementedError) { ValidationRage::BaseNotifier.new.call("event", {}) }
  end
  
  def test_subscribe_to_validation_rage_events
    notifier = ValidationRage::BaseNotifier.new
    ActiveSupport::Notifications.expects(:subscribe).with(/validation_rage:.*/, notifier)
    notifier.subscribe!
  end
end