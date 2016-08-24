# clinitrimax/app/services/publisher.rb
class Publisher
  # In order to publish message we need a exchange name.
  # Note that RabbitMQ does not care about the payload -
  # we will be using JSON-encoded strings
  def self.publish(exchange, message = {}, message_type)
    # Create an exchange
    exchange = channel.direct("clinitrimax.#{exchange}")

    # Create a queue with bound route for the message
    queue = channel.queue("trials").bind(exchange, :routing_key => message_type)

    # Wrap message in message type
    document = Hash.new
    document[message_type] = message

    # publish message
    queue.publish(document.to_json)
  end

 def self.channel
    @channel ||= connection.create_channel
  end

  def self.connection
    @connection ||= Bunny.new(:hostname => "rabbitmq", :user => "guest", :password => "guest").tap do |c|
      c.start
    end
  end
end