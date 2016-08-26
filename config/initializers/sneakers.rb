Sneakers.configure amqp: 'amqp://guest:guest@rabbitmq:5672',
                   exchange: 'clinitrimax.trials',
                   exchange_type: :direct

Sneakers.logger.level = Logger::INFO # the default DEBUG is too noisy