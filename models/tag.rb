require_relative('../db/sql_runner')

class Tag
  attr_reader :id,:name
  def initialize(options)
    @id = options['id'] if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end
