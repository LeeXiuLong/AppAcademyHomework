def class Playwright

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map {|datum| Play.new(datum)}
    end

    def initialize(options)
        @id = options["id"]
        @name = options["name"]
        @birth_year = options["birth_year"]
    end

    def self.find_by_name(name_of_playwright)
        data = PlayDBConnection.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                playwrights
            WHERE
                name = name_of_playwright
        SQL
        data
    end
end