# frozen_string_literal: true

require_relative './user-commands.rb'
require_relative './console-commands.rb'
require_relative './setup.rb'
class QuizModule include CodeDoBo::BotModule
  def initialize(app_class, module_manager)
    @module_manager = module_manager
    @client = @module_manager.client
    @app_class = app_class
    send_message "\u001b[96mStarting quiz module..."
    @language = CodeDoBo::Language.new module_manager.client, __dir__ + '/language'
    setup
    send_message "\u001b[32mSuccessfully started quiz module!"
  end
  def on_enable
    register_user_commands
  end

  def update_prefix
    @module_manager.client[:main].each do |row|
      serverID = row[:server_id]
      @module_manager.bot.server_prefix[serverID] = row[:prefix]
    end
  end

  def help(_user, channel)
    command_language = @language.get_json(channel.server.id)['commands']['help']
    channel.send_embed do |embed|
       embed.title = command_language['title']
       embed.description = command_language['description']
       embed.timestamp = Time.now
       embed.color = command_language['color']
    end
  end
end
