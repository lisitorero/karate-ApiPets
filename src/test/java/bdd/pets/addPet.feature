Feature: Añadir pet al store

  @pet_01
  Scenario Outline: Añadir pets : <id>
    * def bodyUser = read('classpath:resources/json/pets.json')
    Given url urlBase
    And path  '/pet'
    And request bodyUser
    When method POST
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/addPets.csv') |


  @pet_02
  Scenario Outline: Consultar pet por  : <petId>
    * def bodyUser = read('classpath:resources/json/getPet.json')
    Given url urlBase
    And path  "/pet/<petId>"
    And header Content-Type = "application/json"
    And request bodyUser
    When method GET
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/getPets.csv') |


  @pet_03
  Scenario Outline: Actualizar pet por : <id>
    * def bodyUser = read('classpath:resources/json/pets.json')
    Given url urlBase
    And path  "/pet/<petId>"
    And request bodyUser
    When method PUT
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/updatePets.csv') |

  @pet_04
  Scenario Outline: Eliminar pet por : <id>
    Given url urlBase
    And path  "/pet/<petId>"
    When method DELETE
    Then status 200
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/deletePets.csv') |

  @pet_05
  Scenario Outline: Unhappy path - Eliminar pet con <id> invalido
    Given url urlBase
    And path  "/pet/<petId>"
    When method DELETE
    Then status 404
    * print response
    * print 'url:', karate.prevRequest.url
    * print 'headers:', karate.prevRequest.headers
    * print 'method:', karate.prevRequest.method
    Examples:
      | read ('classpath:resources/csv/deletePets.csv') |

