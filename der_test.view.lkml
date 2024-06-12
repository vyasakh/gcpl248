view: der_test {

  derived_table: {
    # sql:
    # SELECT
    #   id , city

    #   FROM
    #   thelook.users

    #   where users.city = {{ _filters['users.city'] | sql_quote }}


    #   ;;
    sql:
    SELECT
      id , city

      FROM
      thelook.users




      ;;
  }


 }
