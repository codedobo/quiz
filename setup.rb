# frozen_string_literal: true

class QuizModule
  def setup
    @client.create_table? :quiz do
      Bignum :server_id, unique: true
      Bignum :solution_chat
    end
    @client.create_table? :quiz_entries do
      primary_key :id
      String :title
      String :body
      Date :expired
    end
    @client.create_table? :quiz_solutions do
      foreign_key :quiz_id, :quiz_entries
      String :word
      Bignum :win_role, null: true
    end
  end
end
