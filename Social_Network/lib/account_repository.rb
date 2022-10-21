require 'account'

class AccountRepository

    def all

        accounts = []
        sql = "SELECT id, email, username FROM accounts;"
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do|record|
            account = Account.new
            account.id = record['id']
            account.email = record['email']
            account.username = record['username']
    
            accounts << account

        end

        return accounts
   
    end

    def find(id)

        sql = "SELECT id, email, username FROM accounts WHERE id = $1;"
        result_set = DatabaseConnection.exec_params(sql, [id])
        record = result_set[0]

        account = Account.new
        account.id = record['id']
        account.email = record['email']
        account.username = record['username']

        return account

    end

    def create(account)

        sql = 'INSERT INTO accounts (email, username) VALUES ($1, $2);'

        DatabaseConnection.exec_params(sql, [account.email, account.username, ])

        return nil
    end

    def delete(id)

        sql = "DELETE FROM accounts WHERE id = $1;"

        DatabaseConnection.exec_params(sql, [id])

        return nil
    end
end