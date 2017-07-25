Sequel.migration do
  up do
    run <<-SQL
      INSERT INTO users (
        SELECT generate_series(1,1000) AS id,
        md5(random()::text) AS username,
        md5(random()::text) AS email
      );
    SQL
  end
end

