Feature: Creación consulta actualizaión y eliminación de usuarios

  @user_01
  Scenario Outline: Registrar usuario masivamente: <username>
    * def bodyUser = read('classpath:resources/json/users.json')
    Given url urlBase
    And path "/user"
    And request bodyUser
    When method POST
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/addUsers.csv') |

  @user_02
  Scenario Outline: Consultar usuario por - <username>
    * def bodyUser = read('classpath:resources/json/getUser.json')
    Given url urlBase
    And path "/user/<username>"
    And request bodyUser
    When method GET
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/getUsers.csv') |

  @user_03
  Scenario Outline: Actualizar usuarios: <username>
    * def bodyUser = read('classpath:resources/json/users.json')
    Given url urlBase
    And path  "/user/<username>"
    And request bodyUser
    When method PUT
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/updateUsers.csv') |

  @user_05
  Scenario Outline: Eliminar usuarios por - <username>
    * def bodyUser = read('classpath:resources/json/getUser.json')
    Given url urlBase
    And path "/user/<username>"
    And request bodyUser
    When method DELETE
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/deleteUsers.csv') |

