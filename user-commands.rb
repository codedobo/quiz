class QuizModule
    def register_user_commands
        register_quiz_command
    end
    def register_quiz_command
        @app_class.register_user_cmd(:quiz, %w[quiz q]) do |command, args, event|
          if args.length == 0
          end
        end
    end
end