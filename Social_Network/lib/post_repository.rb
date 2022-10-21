require 'post'

class PostRepository

    # Selecting all records
    # No arguments
    def all
      # Executes the SQL query:
      # SELECT id, name, cohort_name FROM students;
  
      # Returns an array of Student objects.
    
        posts = []
        sql = "SELECT id, title, content, number_of_views, account_id FROM posts;"
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do|record|
            post = Post.new
            post.id = record['id']
            post.title = record['title']
            post.content = record['content']
            post.number_of_views = record['number_of_views']
            post.account_id = record['account_id']
    
            posts << post

        end

        return posts
   
    end
    
  
    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
      # Executes the SQL query:
      # SELECT id, name, cohort_name FROM students WHERE id = $1;
      sql = "SELECT id, title, content FROM posts WHERE id = $1;"
      result_set = DatabaseConnection.exec_params(sql, [id])
      record = result_set[0]

      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']

      return post 
      # Returns a single Student object.
    end
  
    # Add more methods below for each operation you'd like to implement.
  
    def create(post)

        sql = 'INSERT INTO posts (title, content, number_of_views, account_id) VALUES ($1, $2, $3, $4);'

        DatabaseConnection.exec_params(sql, [post.title, post.content, post.number_of_views, post.account_id])

        return nil

    end
  
    # def update(student)
    # end
  
    def delete(id)

        sql = "DELETE FROM posts WHERE id = $1;"

        DatabaseConnection.exec_params(sql, [id])

        return nil

    end
  end